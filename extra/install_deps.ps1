Write-host "Downloading and installing Choco client"
Invoke-expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Choco
Write-host "Downloading and installing Choco client"
Invoke-expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Write-host "Updating env for choco"
$env:path += ";$env:ALLUSERSPROFILE\chocolatey\bin"

Write-host "Updating cacheLocation for choco"
New-item -Type Directory -path C:\Temp\choco
choco config set --name cacheLocation --value c:\Temp\choco

# Install dependencies using choco
Write-host "Installing choco packages"
choco install git vcredist2010 vcredist2013 -y

[System.Environment]::SetEnvironmentVariable( "Path", $env:Path  + ";C:\Program Files\Git\bin\", [System.EnvironmentVariableTarget]::Machine)

# Cleanup image
Write-host "Cleaning up image"
Remove-item -Recurse C:\temp -force
Remove-Item -Recurse $env:Temp
Write-host "Done cleaning up. Image merge will start now, docker handles that."
