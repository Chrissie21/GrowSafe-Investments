import requests
from django.conf import settings
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from .models import Transaction, Balance
import base64
from datetime import datetime

class MpesaDepositView(APIView):
    permission_classes = [IsAuthenticated]

    def get_access_token(self):
        url = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"
        auth = base64.b64encode(
            f"{settings.MPESA_CONSUMER_KEY}:{settings.MPESA_CONSUMER_SECRET}".encode()
        ).decode()
        headers = {"Authorization": f"Basic {auth}"}
        response = requests.get(url, headers=headers)
        return response.json().get("access_token")

    def post(self, request):
        amount = request.data.get("amount")
        phone = request.data.get("phone")  

        if not amount or not phone:
            return Response({"error": "Amount and phone number are required"}, status=400)

        access_token = self.get_access_token()
        if not access_token:
            return Response({"error": "Failed to authenticate with M-Pesa"}, status=500)

        timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
        password = base64.b64encode(
            f"{settings.MPESA_SHORTCODE}{settings.MPESA_PASSKEY}{timestamp}".encode()
        ).decode()

        url = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"
        headers = {"Authorization": f"Bearer {access_token}"}
        payload = {
            "BusinessShortCode": settings.MPESA_SHORTCODE,
            "Password": password,
            "Timestamp": timestamp,
            "TransactionType": "CustomerPayBillOnline",
            "Amount": amount,
            "PartyA": phone,
            "PartyB": settings.MPESA_SHORTCODE,
            "PhoneNumber": phone,
            "CallBackURL": settings.MPESA_CALLBACK_URL,
            "AccountReference": "GrowSafe",
            "TransactionDesc": "Deposit to GrowSafe",
        }

        response = requests.post(url, json=payload, headers=headers)
        data = response.json()

        if data.get("ResponseCode") == "0":
            transaction = Transaction.objects.create(
                user=request.user,
                amount=amount,
                type="deposit",
                payment_method="vodacom",
                status="pending",
                checkout_request_id=data.get("CheckoutRequestID")
            )
            return Response({
                "message": "M-Pesa payment request sent. Please check your phone.",
                "transaction_id": transaction.id
            })
        return Response({"error": data.get("ResponseDescription", "Payment failed")}, status=400)

class MpesaCallbackView(APIView):
    def post(self, request):
        data = request.data.get("Body", {}).get("stkCallback", {})
        checkout_request_id = data.get("CheckoutRequestID")
        result_code = data.get("ResultCode")

        if not checkout_request_id:
            return Response({"error": "Invalid callback data"}, status=400)

        transaction = Transaction.objects.filter(checkout_request_id=checkout_request_id).first()
        if not transaction:
            return Response({"error": "Transaction not found"}, status=404)

        if result_code == "0":  # Success
            amount = float(data["CallbackMetadata"]["Item"][0]["Value"])
            transaction.status = "completed"
            transaction.save()

            balance, _ = Balance.objects.get_or_create(user=transaction.user)
            balance.amount += amount
            balance.save()
            return Response({"message": "Transaction completed"})
        else:
            transaction.status = "failed"
            transaction.save()
            return Response({"message": "Transaction failed", "reason": data.get("ResultDesc")}, status=400)