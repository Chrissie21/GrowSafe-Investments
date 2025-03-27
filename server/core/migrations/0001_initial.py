# Generated by Django 5.1.7 on 2025-03-19 10:48

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name="Balance",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "amount",
                    models.DecimalField(decimal_places=2, default=0.0, max_digits=10),
                ),
                (
                    "user",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Transaction",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("amount", models.DecimalField(decimal_places=2, max_digits=10)),
                (
                    "type",
                    models.CharField(
                        choices=[
                            ("deposit", "Deposit"),
                            ("withdraw", "Withdraw"),
                            ("profit", "Profit"),
                        ],
                        max_length=10,
                    ),
                ),
                (
                    "payment_method",
                    models.CharField(
                        choices=[
                            ("bank", "Bank Account"),
                            ("vodacom", "Vodacom M-Pesa"),
                            ("airtel", "Airtel Money"),
                            ("tigo", "Tigo Pesa"),
                        ],
                        max_length=10,
                    ),
                ),
                ("timestamp", models.DateTimeField(auto_now_add=True)),
                ("status", models.CharField(default="pending", max_length=20)),
                (
                    "user",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
            ],
        ),
    ]
