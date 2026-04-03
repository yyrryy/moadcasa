@echo off
echo ==============================
echo Setting up Django project...
echo ==============================

REM Step 1: Check Python
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python not found, trying python3...
    set PYTHON=python3
) ELSE (
    set PYTHON=python
)

echo Using %PYTHON%

REM Step 2: Upgrade pip
echo Upgrading pip...
%PYTHON% -m pip install --upgrade pip

REM Step 3: Install dependencies
echo Installing dependencies...
%PYTHON% -m pip install django pandas python-barcode openpyxl pillow

REM Step 4: Make migrations
echo Making migrations...
%PYTHON% manage.py makemigrations

REM Step 5: Apply migrations
echo Applying migrations...
%PYTHON% manage.py migrate

REM Step 6: Create superuser
echo Creating superuser...
echo (You will be prompted to enter username/password)
%PYTHON% manage.py createsuperuser

REM Step 7: Run server
echo Starting Django server...
%PYTHON% manage.py runserver

pause