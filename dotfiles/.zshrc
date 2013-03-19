export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt inc_append_history
setopt share_history

# disable annoying stuff
unsetopt autocd beep extendedglob nomatch notify

# vim mode
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd '/' history-incremental-pattern-search-backward

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/arjen/.zshrc'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# init completion
autoload -Uz compinit
compinit

alias ls='ls --color=auto'
alias lc='ls -lh --color --group-directories-first'
alias gt='urxvt'
alias django='python manage.py'
alias watch.py='python ~/bin/watch.py'

# git aliasses
alias gits='git status'
alias gitd='git diff'
alias gitc='git checkout'
alias gitdc='git diff --cached'
alias gitca='git commit --amend'
alias gitap='git add -p'

function gvimrt {
	gvim --remote-tab $1
}

function up {
	for a in {1..$1}
	do
		cd ../
	done
}

function reproot {
	cd `pwd | sed 's/repositories\/\([a-z0-9A-Z]*\).*$/repositories\/\1/'`
}

autoload colors && colors
export PROMPT="
 { %{$fg[blue]%}%m%{$fg[white]%}: %~%{$reset_color%} } "

# env
PYTHONDONTWRITEBYTECODE=1
