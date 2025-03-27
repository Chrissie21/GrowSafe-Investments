from django.db import models
from django.contrib.auth.models import User

class Transaction(models.Model):
    TRANSACTION_TYPES = (
        ('deposit', 'Deposit'),
        ('withdraw', 'Withdraw'),
        ('profit', 'Profit'),
    )
    PAYMENT_METHODS = (
        ('vodacom', 'Vodacom M-Pesa'),
        ('airtel', 'Airtel Money'),
        ('tigo', 'Tigo Pesa'),
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    type = models.CharField(max_length=10, choices=TRANSACTION_TYPES)
    payment_method = models.CharField(max_length=10, choices=PAYMENT_METHODS)
    timestamp = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=20, default='pending')  # pending, completed, failed
    checkout_request_id = models.CharField(max_length=50, blank=True, null=True)  # For M-Pesa tracking

    def __str__(self):
        return f"{self.user.username} - {self.type} - {self.amount}"

class Balance(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)

    def __str__(self):
        return f"{self.user.username} - {self.amount}"