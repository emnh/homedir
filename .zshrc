
# on top so it can be overridden
source ~/.zshrc-grml

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=3
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/emh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

mkdir -p ~/.zsh
HISTFILE=~/.zsh/history
HISTSIZE=10000000
SAVEHIST=10000000
setopt sharehistory
setopt appendhistory autocd notify
setopt autopushd
setopt pushd_ignore_dups
setopt autocontinue
unsetopt beep
bindkey -e

bindkey '^[[Z' reverse-menu-complete

source ~/.bash_zsh_rc
