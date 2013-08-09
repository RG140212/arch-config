#------------------------------
# Import scripts
#------------------------------
source $HOME/.zsh/git.zsh
source $HOME/.zsh/completion.zsh

#------------------------------
# (En|Dis)able common options
#------------------------------
unsetopt AUTOCD BEEP NOMATCH NOTIFY

export HISTSIZE=10000
export HISTFILE="${HOME}/.history"
export SAVEHIST=$HISTSIZE

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

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/$USER/.zshrc'
setopt extendedglob
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# init completion
autoload -Uz compinit
compinit

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
function gitpl {
	git pull origin `git branch | grep \* | sed 's/\* //'`
}
function gitps {
	git push origin `git branch | grep \* | sed 's/\* //'`
}

# system aliases
alias reboot='sudo reboot'
alias halt='sudo halt'

# misc aliases
alias ct='urxvt &'
alias django='python manage.py'

# cd aliases
alias cdoccator="cd ~/Dropbox/Studie/Stage/Occator/"

#------------------------------
# Useful functions
#------------------------------
# open vim using a server name for future reference
function v {
	if [ -z $2 ]
	then
		# oke this looks convoluted, let's explain:
		# we ask i3 for the desktop number and let this be the server name per default
		# such that per default, we open a file on the same space as the terminal we open it from
		2=`i3-msg --type get_workspaces | python -c \
			"import sys; import json; print( list( filter( lambda w:\
			w[ 'visible' ], json.loads( sys.stdin.read() )))[0][ 'num' ])"`
	fi

	echo $2
	urxvt -e vim --servername $2 --remote-tab-silent $1 &> /dev/null &
}

function up {
	for a in {1..$1}
	do
		cd ../
	done
}

function reproot {
	cd `pwd | sed 's/repositories\/\([a-z0-9A-Z\_\.\-]*\).*$/repositories\/\1/'`
}

function tex-watch {
	watch.py . tex "rubber -d $1"
}

# open any file specified in $XDG_DATA_HOME/applications/mimeapps.list
function open {
	FILE=$1
	VERBOSE=false

	while getopts "v" OPT
	do
		case $OPT in
			v)
				VERBOSE=true
				FILE=$2
				;;
		esac
	done

	if $VERBOSE; then
		xdg-open $FILE
	else
		xdg-open $FILE &>/dev/null &
	fi
}

#------------------------------
# ZSH prompt
#------------------------------
autoload colors && colors

export PROMPT="
%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m%p %~
	→ %{$reset_color%} "
export RPROMPT=$'$(vcs_info_wrapper)$(date "+%{$fg[blue]%}%a %b %e %{$fg_bold[blue]%}%H:%M%{$reset_color%}")'

