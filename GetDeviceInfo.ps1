# Windows PowerShell script to gather the hardware hash and create a CSV file

Set-ExecutionPolicy -Scope CurrentUser Unrestricted

# Creted a new foler in the C drive for the CSV file.

New-Item -Type Directory -Path "C:\HWID"
Write-Host -ForgroundColor Green "Creating HWID directory in C drive"

# Creted a new foler in the C drive for the CSV file.

Set-Location -Path "C:\HWID"
Write-Host -ForgroundColor Green "Changing to new directory"

$env:Path += "C:\Program Files\WindowsPowerShell\Scripts"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned

# Install the script from online

Write-Host -ForgroundColor Green "Getting the script from Microsoft"
Install-Script -Name Get-WindowsAutoPilotInfo

# Export the CSV file

Get-WindowsAutoPilotInfo -OutputFile AutoPilotHWID.csv
