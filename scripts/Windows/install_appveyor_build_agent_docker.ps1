Write-Host "Installing AppVeyor Build Agent Core"
Write-Host "===================================="

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$destPath = "C:\Program Files\AppVeyor\BuildAgent"

if (Test-Path $destPath) {
	Remove-Item $destPath -Recurse -Force
}

Write-Host "Downloading..."
$zipPath = "$env:TEMP\appveyor-build-agent.zip"
(New-Object Net.WebClient).DownloadFile('https://www.appveyor.com/downloads/appveyor-build-agent/7.0/windows/appveyor-build-agent-windows-x64.zip', $zipPath)

Write-Host "Unpacking..."
7z x $zipPath -o"$destPath" | Out-Null

Remove-Item $zipPath -Force

Write-Host "AppVeyor Build Agent installed"