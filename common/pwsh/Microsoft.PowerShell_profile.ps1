## PowerShell Profile

# Vi Mode
Set-PSReadlineOption -EditMode Vi -ViModeIndicator Cursor

# Theming
If (Get-Command Set-PoshPrompt) {
	Set-PoshPrompt -Theme ys
	Set-PSReadlineOption -ExtraPromptLineCount 1 -PromptText "% " -ContinuationPrompt "> "
}
# Aliases
New-Alias -Name "g" -Value "git"
