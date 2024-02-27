# Get the script's directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Define the relative path for the driver
$DriverPath = Join-Path $ScriptDir "2350d\Dell-2350d-Win10\RarSFX0\drivers\Print\Win_2kXP\DKACH540.inf"

# List of printer names to cycle through
$PrinterNames = @("Dell 2350d Laser Printer") # Add or remove printer names as needed

foreach ($PrinterName in $PrinterNames) {
    Try {
        # Use PnPUtil to add the driver - assuming it applies to all printers similarly
        & pnputil /add-driver $DriverPath /install
        If ($LASTEXITCODE -ne 0) {
            Throw "Failed to install driver from $DriverPath for printer $PrinterName. Exit code: $LASTEXITCODE"
        }
    } Catch {
        # Error handling if needed
    }
}

Stop-Service -Name Spooler -Force
Start-Sleep -Seconds 2
Start-Service -Name Spooler
