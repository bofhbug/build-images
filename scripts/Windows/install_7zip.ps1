﻿Write-Host "Installing 7-Zip"
Write-Host "================"

$exePath = "$env:USERPROFILE\7z1805-x64.exe"
Invoke-WebRequest https://www.7-zip.org/a/7z1805-x64.exe -OutFile $exePath
cmd /c start /wait $exePath /S
del $exePath

$sevenZipFolder = 'C:\Program Files\7-Zip'
Add-SessionPath $sevenZipFolder
Add-Path "$sevenZipFolder"

[Environment]::SetEnvironmentVariable("7zip", "`"$sevenZipFolder\7z.exe`"", "Machine")

Write-Host "7-Zip installed"