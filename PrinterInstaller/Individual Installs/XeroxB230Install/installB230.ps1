# Get the script's directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Define the relative path for the driver
$DriverPath = Join-Path $ScriptDir "UNIV_5.979.3.0_PCL6_x64_Driver.inf\x3UNIVX.inf"

# List of printer names to cycle through
$PrinterNames = @("Xerox B230 Printer") # Add or remove printer names as needed

# Function to log errors
function Log-Error {
    Param (
        [string]$Message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp $Message" | Out-File -FilePath $LogFilePath -Append
}

foreach ($PrinterName in $PrinterNames) {
    Try {
        # Use PnPUtil to add the driver - assuming it applies to all printers similarly
        & pnputil /add-driver $DriverPath /install
        If ($LASTEXITCODE -ne 0) {
            Throw "Failed to install driver from $DriverPath for printer $PrinterName. Exit code: $LASTEXITCODE"
        } else {
            "$PrinterName driver installation successful." | Out-File -FilePath $LogFilePath -Append
        }
    } Catch {
        Log-Error "Error installing driver for ${PrinterName}: $_"

    }
}

Stop-Service -Name Spooler -Force

Start-Sleep -Seconds 2

Start-Service -Name Spooler
