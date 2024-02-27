@echo off
cls
net session >nul 2>&1
if %errorlevel% == 0 (
    echo Success: Administrative privileges confirmed.
) else (
    echo Failure: Please run this script as an administrator.
    pause
    exit
)

set "basePath=C:\Users\e087037\Desktop"

start control printers
echo Welcome to Jared's Printer installer!
echo Select the exact name of the Printer as it appears in Devices and printers from the list below.
echo.
echo 1. Dell 2330d Laser Printer
echo 2. Dell 2350d Laser Printer
echo 3. HP LaserJet Pro 3001-3008
echo 4. HP LaserJet M203-M206
echo 5. Xerox B230 Printer
echo 6. Exit (More Printer names can be added just ask Jared to add them)
echo.

set /p choice=Enter your choice (1-6): 
if "%choice%"=="1" (
    powershell -File "%basePath%\PrinterInstaller\Individual Installs\2350dInstall\installDell2330.ps1" -PrinterName "Dell 2330d Laser Printer"
    echo Printer driver applied to Dell 2330d Laser Printer. Please send a test print to confirm connectivity.
) else if "%choice%"=="2" (
    powershell -File "%basePath%\PrinterInstaller\Individual Installs\2350dInstall\installDell2350.ps1" -PrinterName "Dell 2350d Laser Printer"
    echo Printer driver applied to Dell 2350d Laser Printer. Please send a test print to confirm connectivity.
) else if "%choice%"=="3" (
    powershell -File "%basePath%\PrinterInstaller\Individual Installs\HPLaserJetPro3001dw\install3001.ps1" -PrinterName "HP LaserJet Pro 3001-3008"
    echo Printer driver applied to HP LaserJet Pro 3001-3008. Please send a test print to confirm connectivity.
) else if "%choice%"=="4" (
    powershell -File "%basePath%\PrinterInstaller\Individual Installs\HPLaserJetProM203dwInstall\installM203dw.ps1" -PrinterName "HP LaserJet M203-M206"
    echo Printer driver applied to HP LaserJet M203-M206. Please send a test print to confirm connectivity.
) else if "%choice%"=="5" (
    powershell -File "%basePath%\PrinterInstaller\Individual Installs\XeroxB230Install\installB230.ps1" -PrinterName "Xerox B230 Printer"
    echo Printer driver applied to Xerox B230 Printer. Please send a test print to confirm connectivity.
) else if "%choice%"=="6" (
    echo Exiting...
    exit
) else (
    echo Invalid choice, please try again.
)

pause
