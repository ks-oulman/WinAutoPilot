# Windows PowerShell script to gather the hardware hash and create a CSV file

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine

# Creted a new foler in the C drive for the CSV file.

New-Item -Type Directory -Path "C:\HWID"
Write-Host "Creating HWID directory in C drive" -ForgroundColor Green

# Creted a new foler in the C drive for the CSV file.

Set-Location -Path "C:\HWID"
Write-Host "Changing to new directory" -ForgroundColor Green

$env:Path += "C:\Program Files\WindowsPowerShell\Scripts"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned

# Install the script from online

Write-Host "Getting the script from Microsoft" -ForgroundColor Green
Install-Script -Name Get-WindowsAutoPilotInfo

# Export the CSV file

Get-WindowsAutoPilotInfo -OutputFile AutoPilotHWID.csv
