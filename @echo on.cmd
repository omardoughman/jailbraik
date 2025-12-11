@echo off
echo Creating folders...

IF NOT EXIST "C:\administrator" (
    mkdir "C:\administrator"
)

IF NOT EXIST "C:\administrator\pro" (
    mkdir "C:\administrator\pro"
)

cd /d "C:\administrator\pro"

echo.
echo === Checking Python ===
python --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo Python is not installed!
    pause
    exit /b
)

echo Creating Python virtual environment...
python -m venv venv

IF NOT EXIST "venv\Scripts\activate.bat" (
    echo Failed to create Python venv!
    pause
    exit /b
)

echo Activating venv...
call venv\Scripts\activate.bat

echo Installing pynput inside venv...
pip install pynput

echo.
echo === Checking Node.js ===
node --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo Node.js is not installed!
    pause
    exit /b
)

echo Creating Node.js environment...
IF NOT EXIST "package.json" (
    npm init -y
)

echo All environments created successfully!
echo Python venv + Node.js ready in: C:\administrator\pro
pause
