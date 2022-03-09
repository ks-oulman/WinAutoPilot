# WinAutoPilot
Gathers a device's hardware hash for manual enrollment in Intune

This scrip was obtained from Microsoft. For more details visit https://docs.microsoft.com/en-us/mem/autopilot/add-devices

This script must be ran from an elevated PowerShell window.

PS C:\Windows\system32> Get-WindowsAutoPilotInfo -OutputFile AutoPilotHWID.csv
