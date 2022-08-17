# Windows PowerShell script to gather the hardware hash and create a CSV file

$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
$testadmin = $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
if ($testadmin -eq $false) {
Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
exit $LASTEXITCODE
}

# Creted a new folder in the C drive for the CSV file.

New-Item -Type Directory -Path "C:\HWID"
Write-Host -ForegroundColor Green "Creating HWID folder in C drive"
Write-Host ""
Write-Host ""

# Creted a new folder in the C drive for the CSV file.

Set-Location -Path "C:\HWID"
Write-Host -ForegroundColor Green "Changing to new folder"
Write-Host ""
Write-Host ""

$env:Path += "C:\Program Files\WindowsPowerShell\Scripts"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned

# Install the script from online

Write-Host -ForegroundColor Cyan "Getting the script from Microsoft"
Write-Host ""
Write-Host ""
Install-Script -Name Get-WindowsAutoPilotInfo

# Export the CSV file

Get-WindowsAutoPilotInfo -OutputFile AutoPilotHWID.csv
