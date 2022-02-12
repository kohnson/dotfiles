## PowerShell Profile

# Vi Mode
 Set-PSReadlineOption -EditMode Vi
 Set-PSReadlineOption -ViModeIndicator Cursor

# Theming
 If (Get-Command -ErrorAction SilentlyContinue oh-my-posh) {
	 oh-my-posh --init --shell pwsh --config "~/dotfiles/common/pwsh/ys.omp.json" | Invoke-Expression
	 If ([Security.Principal.WindowsIdentity]::GetCurrent().Groups -contains 'S-1-5-32-544') {Set-PSReadlineOption -PromptText "# " -ContinuationPrompt "> "}
	 Else {Set-PSReadlineOption -PromptText "% " -ContinuationPrompt "> "}
 }

# Aliases
 New-Alias "g" "git"			# Git
 New-Alias "ytdl" "youtube-dl"		# Youtube-DL
 New-Alias "ff" "ffmpeg"		# FFmpeg
 New-Alias "v" "nvim"			# Neovim
 New-Alias "omp" "oh-my-posh"		# Oh-My-Posh
 Remove-Alias -Name "r"	# Remove R alias (runs last command)
 If ($IsWindows) {
	 New-Alias "lo" "soffice.com" 		# Libreoffice
	 New-Alias "grep" "Select-String"	# Grep
	 New-Alias "which" "where.exe"		# Which
	 New-Alias "touch" "New-Item"		# Touch
 }

# Personal modules
 if (Test-Path "$HOME\Documents\PowerShell\personalmodules.ps1") {Import-Module "$HOME\Documents\PowerShell\personalmodules.ps1"}
 else {Write-Host -ForegroundColor Yellow "No personalmodules.ps1 found."}

# LS, sorting by date
 function lsd {Get-ChildItem | Sort-Object LastWriteTime -Descending}
 
# LS, name only
 Function lsn {Get-ChildItem -Name}
 
# Write a note
 Function note {nvim "$HOME/sync/note.md"}

# Write about stuff, like some kind of loser
 Function dry {nvim "$HOME/Documents/writing/log.rmd"}
 
# Get public IP
 Function ip {$(Invoke-WebRequest ident.me).Content}

# Get weather
 If ($env:WTTRlocation -eq $null) {Write-Host -ForegroundColor Yellow "`$env:WTTRlocation has not been set.`n"}
 Function wttr {Invoke-RestMethod "https://wttr.in/$env:WTTRlocation"}

# Fix Posh Prompt
 Function fposh {Copy-Item "$HOME\dotfiles\common\pwsh\ys.omp.json" $(Get-PoshContext | Select-String ".omp.json") }
