## PowerShell Profile

# Vi Mode
 Set-PSReadlineOption -EditMode Vi
 Set-PSReadlineOption -ViModeIndicator Cursor

# Theming
 If (Get-Command -ErrorAction SilentlyContinue Set-PoshPrompt) {
	 Set-PoshPrompt -Theme ys
	 Set-PSReadlineOption -PromptText "% " -ContinuationPrompt "> "
 }

# Aliases
 New-Alias -Name "g" -Value "git"		# Git
 New-Alias -Name "ytdl" -Value "youtube-dl"	# Youtube-DL
 New-Alias -Name "ff" -Value "ffmpeg"		# FFmpeg
 New-Alias -Name "which" -Value "where.exe"	# Which

# Personal modules
 if (Test-Path "$HOME\Documents\PowerShell\personalmodules.ps1") {Import-Module "$HOME\Documents\PowerShell\personalmodules.ps1"}
 else {Write-Host -ForegroundColor Yellow "No personalmodules.ps1 found."}

# LS, sorting by date
 function Get-DateItem {Get-ChildItem | Sort-Object LastWriteTime -Descending}
 New-Alias -Name "lsd" -Value "Get-DateItem"
 
# LS, name only
 Function Get-ChildItemName {Invoke-Expression "Get-ChildItem -Name"}
 New-Alias -Name "lsn" -Value "Get-ChildItemName"
 
# Write a note
 Function Edit-Note {nvim "$HOME/sync/note.md"}
 New-Alias -Name "note" -Value "Edit-Note"
 
# Kill all instances of a program
 
# Get public IP
 Function Get-IPAddress {Invoke-WebRequest ident.me | Select-Object Content}
 New-Alias -Name "ip" -Value "Get-IPAddress"
