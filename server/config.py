# config.py

# Django Secret Key
SECRET_KEY = "7)y0w&^xoe$gacci#%!9p4mzb@ad6fl_c936s(-#$c=oy1e=j9"

# Database Configuration
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'growsafe_db',
        'USER': 'chris',
        'PASSWORD': '13241324',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}

# AzamPay Configuration
AZAMPAY_CLIENT_ID = "5d48aa27-010d-4959-9487-5b9acf6c5668"
AZAMPAY_CLIENT_SECRET = "L1CdzYKEPKL1Bo6dCnWeK5N3c603PjX+/iuLYzwZALXuq20UpULDGwL7LY/u7OJdDfhacC5j/6D7vQyO/UXmVrK/k2fs9L4vEjYhtPK+p+PobU2MGsEryyRVSxsb1YUqk+cxYtU9cHO96XyF7NPjBlUYPeShkefwm96P83PleDUAn6nVwPpBDhcwkPWY80RaD25oSWU2AnzccXQ2BWIWcA+Rq6tmp3EvPXx8xtFd+ifwZpR1YiEDWWglf/kYVlfIgdtSICYr3bp5oppFeM0KtX5TiByQtOIAm6Jj2AIbheRRFRO2KM+zxmWJW4DqpF8JMgOuYM67ge44qEcTDgSsUolIuLydQsAjBpcLkn9AMELXm6hw9Oby25BzNO6mpHkpO+qjGJ7XCSAyAv8zc67s9zKI2g4Q3prqXTF43AbtqPnxnkwKqNWjyqpyv4UHdPsSaEBLhZ56BUj2yxqXv08n5Q9PfFoiR0dZrbLxDUL6Q3P21jO2QkajjPF1h2uKlfG8MV1uHaDlwmBH6+Ju/95DJAyH8xH7XyhZvupqNw2HKME94Sb9/eM6CXO0O9Axg+S3CrYFPXxEncuJ1PAK4Im8BLh9+yrsJI8P6Hs/kkaBeeCVziCFXRqzBs1wzxY9D0GWct18O3ijKnsFV1xHv/OXiy8LJcAxhPcnCczIzJpWV4I="
AZAMPAY_APP_NAME = "GrowSafe"
AZAMPAY_CALLBACK_URL = "https://your-backend-url/callback"