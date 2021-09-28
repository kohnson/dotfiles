## Install script for my dotfiles (WINDOWS ONLY)

# Wallpaper (None of the methods described by the internet will work properly on other pcs)
Copy-Item -Force .\common\wal.jpg "$env:HOMEPATH\Pictures\Saved Pictures\Backgrounds"
Switch (Read-Host -Prompt "Change wallpaper now? (y/N)") {
	"y" {ms-settings:personalization-background}
	Default {Write-Host -ForegroundColor Blue "Wallpaper saved to C:\$env:HOMEPATH\Pictures\Saved Pictures\Backgrounds"}
}

# PowerShell config
Copy-Item -Force .\common\pwsh\Microsoft.PowerShell_profile.ps1 $PROFILE
If (Get-Command -ErrorAction SilentlyContinue Get-InstalledModule oh-my-posh) {
	Copy-Item -Force ".\common\pwsh\ys.omp.json" "$HOME\Documents\PowerShell\Modules\oh-my-posh\$($(Get-InstalledModule oh-my-posh).Version)\themes\ys.omp.json"
}
Else {
	Write-Host -ForegroundColor Red "Oh-My-Posh is not installed. Install it now?"
	$choice = Read-Host -Prompt "(Y/n)"
	Switch ($choice) {
		Default {
			Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
			Install-Module oh-my-posh -Scope CurrentUser
			Copy-Item -Force ".\common\pwsh\ys.omp.json" "$HOME\Documents\PowerShell\Modules\oh-my-posh\$($(Get-InstalledModule oh-my-posh).Version)\themes\ys.omp.json"
		}
		"n" {Write-Host -ForegroundColor Blue "Install at any time by re-running this script."}
	}
}

# ConEmu config
Copy-Item -Force ".\windows\conemu\ConEmu.xml" "$env:APPDATA\ConEmu.xml"

# Qutebrowser config
Copy-Item -Force .\common\qutebrowser\autoconfig.yml $env:APPDATA\qutebrowser\config\autoconfig.yml
