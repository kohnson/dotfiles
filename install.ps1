## Install script for my dotfiles (WINDOWS ONLY)

# Wallpaper (None of the methods described by the internet will work properly on other pcs)
Copy-Item -Force .\wal\* "$HOME\Pictures\Saved Pictures\Backgrounds"
Switch (Read-Host -Prompt "Change wallpaper now? (y/N)") {
	"y" {ms-settings:personalization-background}
	Default {Write-Host -ForegroundColor Blue "Wallpaper saved to C:\$HOME\Pictures\Saved Pictures\Backgrounds"}
}

# PowerShell config
Copy-Item -Force .\common\pwsh\Microsoft.PowerShell_profile.ps1 $PROFILE
If (Get-Command -ErrorAction SilentlyContinue Get-InstalledModule oh-my-posh) {
	Copy-Item -Force ".\common\pwsh\ys.omp.json" $(Get-PoshContext | Select-String "PowerShell")
}
Else {
	Write-Host -ForegroundColor Red "Oh-My-Posh is not installed. Install it now?"
	$choice = Read-Host -Prompt "(Y/n)"
	Switch ($choice) {
		Default {
			Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
			Install-Module oh-my-posh -Scope CurrentUser
			Copy-Item -Force ".\common\pwsh\ys.omp.json" "$(Get-PoshContext | Select-String "PowerShell")
		}
		"n" {Write-Host -ForegroundColor Blue "Install at any time by re-running this script."}
	}
}

# ConEmu config
Copy-Item -Force ".\windows\conemu\ConEmu.xml" "$HOME\scoop\persist\conemu\ConEmu\ConEmu.xml"

# Qutebrowser config
Copy-Item -Force .\common\qutebrowser\autoconfig.yml $env:APPDATA\qutebrowser\config\autoconfig.yml

# Modest CSS
If (Test-Path -ErrorAction SilentlyContinue "~\Programs\share\") {Copy-Item -Force .\common\modest.css $HOME\Programs\share\modest.css}
Else {
	If (Test-Path -ErrorAction SilentlyContinue "~\Programs\") {MkDir "~\Programs\share"}
	Else {MkDir "~\Programs" && MkDir "~\Programs\share"}
	Copy-Item -Force .\common\modest.css $HOME\Programs\share\modest.css
}

# Git config
Copy-Item -Force ".\common\.gitconfig" "~\.gitconfig"
