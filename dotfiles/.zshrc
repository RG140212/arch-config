#------------------------------
# Import scripts
#------------------------------
source $HOME/.zsh/git.zsh
source $HOME/.zsh/completion.zsh

#------------------------------
# (En|Dis)able common options
#------------------------------
unsetopt AUTOCD BEEP NOMATCH NOTIFY

# ignore duplicates in history
setopt HIST_IGNORE_ALL_DUPS

# parallel history across terminal sessions
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

#------------------------------
# Keybindings
#------------------------------
# navigation mode (-e for emacs, -v for vim)
bindkey -v

# leave expansion to _expand
bindkey '^I' complete-word

bindkey -M viins 'jj' vi-cmd-mode

# vi mode with emacs behaviour
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M viins '^r' history-incremental-pattern-search-backward
bindkey '^[[Z' reverse-menu-complete

# vim-style behaviour
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^u' backward-kill-line
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo
bindkey -M vicmd '^R' redo

# keybinding to prepend 'sudo' to command
bindkey -M vicmd -s 'T' '^[ Isudo ^[A'

#------------------------------
# Aliases
#------------------------------
# directory listing aliases
alias ls='ls --color=auto --group-directories-first'
alias lc='ls -lh'
alias la='ls -lha'
alias l='ls'

# handy global aliasses
alias -g '...'='../../'
alias -g '....'='../../../'

# git aliases
alias gits='git status'
alias gitd='git diff'
alias gitc='git checkout'
alias gitdc='git diff --cached'
alias gitca='git commit --amend'
alias gitap='git add -p'

# system aliases
alias reboot='sudo reboot'
alias halt='sudo halt'

# misc aliases
alias ct='urxvt &'
alias django='python manage.py'
alias watch.py='python ~/bin/watch.py'

# vim aliases
alias gvimr="gvim --servername GVIMREMOTE --remote-silent"
alias vimr="vim --servername VIMREMOTE --remote-silent"
alias gvimrt="gvim --servername GVIMREMOTE --remote-tab-silent"
alias vimrt="vim --servername VIMREMOTE --remote-tab-silent"

#------------------------------
# Useful functions
#------------------------------
function up {
	for a in {1..$1}
	do
		cd ../
	done
}

function reproot {
	cd `pwd | sed 's/repositories\/\([a-z0-9A-Z\_\.\-]*\).*$/repositories\/\1/'`
}

#------------------------------
# ZSH prompt
#------------------------------
autoload colors && colors

export PROMPT="
%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m%p %~
	→ %{$reset_color%} "
export RPROMPT=$'$(vcs_info_wrapper)$(date "+%{$fg[blue]%}%a %b %e %{$fg_bold[blue]%}%H:%M%{$reset_color%}")'

