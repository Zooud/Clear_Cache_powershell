# Clear Windows cache and temporary files

# Clear Windows Store cache
Write-Output "Clearing Windows Store cache..."
Get-ChildItem -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsStore*" -Recurse | Remove-Item -Force -Recurse

# Clear Internet Explorer cache
Write-Output "Clearing Internet Explorer cache..."
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8

# Clear Edge cache
Write-Output "Clearing Microsoft Edge cache..."
Clear-DnsClientCache
Clear-Host
Clear-RecycleBin -Force
Get-ChildItem -Path "$env:LOCALAPPDATA\Packages\Microsoft.MicrosoftEdge*" -Recurse | Remove-Item -Force -Recurse

# Clear user temporary files
Write-Output "Clearing user temporary files..."
Remove-Item -Path "$env:TEMP\*" -Force -Recurse
Remove-Item -Path "$env:LOCALAPPDATA\Temp\*" -Force -Recurse

# Clear system temporary files
Write-Output "Clearing system temporary files..."
Remove-Item -Path "$env:SYSTEMROOT\Temp\*" -Force -Recurse

# Clear Windows update cache
Write-Output "Clearing Windows update cache..."
net stop wuauserv
Remove-Item -Path "$env:WINDIR\SoftwareDistribution\Download\*" -Force -Recurse
net start wuauserv

Write-Output "Cache and temporary files cleared successfully."