## Install script for my dotfiles (WINDOWS ONLY)

# PowerShell config
Copy-Item -Force .\common\pwsh\Microsoft.PowerShell_profile.ps1 $PROFILE
If (Get-Command -ErrorAction SilentlyContinue Get-InstalledModule oh-my-posh) {
	Copy-Item -Force ".\common\pwsh\ys.omp.json" $(Get-PoshContext | Select-String ".json")
}
Else {
	Write-Host -ForegroundColor Red "Oh-My-Posh is not installed. Install it now?"
	$choice = Read-Host -Prompt "(Y/n)"
	Switch ($choice) {
		Default {
			Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
			Install-Module oh-my-posh -Scope CurrentUser
			Copy-Item -Force ".\common\pwsh\ys.omp.json" $(Get-PoshContext | Select-String ".json")
		}
		"n" {Write-Host -ForegroundColor Blue "Install at any time by re-running this script."}
	}
}

# ConEmu config
Copy-Item -Force ".\windows\ConEmu.xml" "$HOME\scoop\persist\conemu\ConEmu\ConEmu.xml"

# Qutebrowser config
Copy-Item -Force .\common\qutebrowser\autoconfig.yml $env:APPDATA\qutebrowser\config\autoconfig.yml

# Git config
Copy-Item -Force ".\common\.gitconfig" "~\.gitconfig"

# Winfetch config
Copy-Item -Force ".\windows\winfetch\config.ps1" "~\.config\winfetch\"
