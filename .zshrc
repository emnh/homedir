# vim: set filetype=zsh

# at top so it can be overridden
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
export \
  HISTFILE=~/.zsh/history \
  HISTSIZE=10000000 \
  SAVEHIST=10000000 \
  PS1="%{%}%(?..%?%1v )%{%}%n%{%}@%m %40<...<%B%~%b%<< %j%# "
watch=()
setopt sharehistory
setopt appendhistory autocd notify
setopt autopushd
setopt pushd_ignore_dups
setopt autocontinue
unsetopt beep
bindkey -e

bindkey '^[[Z' reverse-menu-complete

# git branch in prompt
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

source ~/.bash_zsh_rc
