## PowerShell Profile

# Vi Mode
 Set-PSReadlineOption -EditMode Vi -ViModeIndicator Cursor

# Theming
 If (Get-Command -ErrorAction SilentlyContinue Set-PoshPrompt) {
	 Set-PoshPrompt -Theme ys
	 Set-PSReadlineOption -ExtraPromptLineCount 1 -PromptText "% " -ContinuationPrompt "> "
 }

# Aliases
 New-Alias -Name "g" -Value "git"

# Personal modules
 if (Test-Path C:\Users\Angelo\Documents\PowerShell\personalmodules.ps1) {Import-Module C:\Users\Angelo\Documents\PowerShell\personalmodules.ps1}
 else {Write-Host -ForegroundColor Yellow "No personalmodules.ps1 found."}
