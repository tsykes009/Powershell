Write-Host "PowerShell Version:`t$($PSVersionTable.PSVersion)" -ForegroundColor Green
Write-Host "PowerShell Edition:`t$($PSVersionTable.PSEdition)" -ForegroundColor Green
Write-Host "PowerShell Build:`t$($PSVersionTable.BuildVersion)" -ForegroundColor Green
Write-Host "PowerShell Remoting:`t$($PSVersionTable.PSRemotingProtocolVersion)" -ForegroundColor Green

# MODULE IMPORTS
Import-Module -NAME PSReadLine
Import-Module -Name Terminal-Icons
Import-Module -Name posh-git
Import-Module -Name Az.Monitor
Import-Module -Name Az.ResourceGraph
Import-Module -Name Az.Accounts
Import-Module -Name Az.Resources

# SETTINGS AND PARAMETERS
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

try {
    oh-my-posh init pwsh --config (Join-Path $env:POSH_THEMES_PATH -ChildPath aliens.omp.json) | Invoke-Expression -ErrorAction Stop
} catch {
    winget install JanDeDobbeleer.OhMyPosh -s winget --location $env:USERPROFILE\Documents\Powershell
    oh-my-posh init pwsh --config (Join-Path $env:POSH_THEMES_PATH -ChildPath aliens.omp.json) | Invoke-Expression -ErrorAction Stop
}

# ALIAS
Set-Alias -Name edge -Value Start-MSEdge

# STARTUP
Get-ChildItem -Path "$(Split-Path -Path $PROFILE.CurrentUserCurrentHost -Parent)\Startup" -Recurse -Filter *.ps1 | ForEach-Object { . $_.FullName }