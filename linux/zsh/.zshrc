## ZSHRC

## Oh-My-ZSH
export ZSH="$HOME/.oh-my-zsh"		# oh-my-zsh location
ZSH_THEME="candy"			# Theme
HYPHEN_INSENSITIVE="true"		# _/- are interchangeable for completion
# DISABLE_AUTO_UPDATE="true"		# Uncomment to disable oh-my-zsh auto update
export UPDATE_ZSH_DAYS=7		# oh-my-zsh update frequency
# DISABLE_MAGIC_FUNCTIONS="true"	# Uncomment if certain functions do not work
ENABLE_CORRECTION="true"		# Enable command correction
plugins=(git)				# Plugins
if [ -f $ZSH/oh-my-zsh.sh ]; then	# Load oh-my-zsh
	source $ZSH/oh-my-zsh.sh
fi

## Aliases
# General purpose
	alias py="python3"
	alias :q="exit"
	alias wttr="curl wttr.in"
# Package management
	alias psyu="yay -Syuv"
	alias pins="sudo pacman -Syv"
	alias pains="yay -Syv"
	alias pupd="sudo pacman -Syyv"
	alias prem="sudo pacman -Rsv"
# Keyboard management
	alias dvorak="setxkbmap -model pc104 -layout us -variant dvorak"
	alias vdvorak="loadkeys dvorak"
	alias qwerty="setxkbmap -model pc104 -layout us"
	alias vqwerty="loadkeys us"
