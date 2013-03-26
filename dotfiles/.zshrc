# import script for git prompt
source $HOME/.zshlib/git.zsh

export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt inc_append_history
setopt share_history

# disable annoying stuff
unsetopt autocd beep extendedglob nomatch notify

# vim mode
#bindkey -v
#bindkey -M viins 'jj' vi-cmd-mode
#bindkey -M vicmd '/' history-incremental-pattern-search-backward
# emacs mode
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/$USER/.zshrc'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# init completion
autoload -Uz compinit
compinit

# directory listing aliases
alias ls='ls --color=auto --group-directories-first'
alias lc='ls -lh'
alias la='ls -lha'
alias l='ls'

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
alias gt='urxvt'
alias django='python manage.py'
alias watch.py='python ~/bin/watch.py'

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
	cd `pwd | sed 's/repositories\/\([a-z0-9A-Z\_\.\-]*\).*$/repositories\/\1/'`
}

autoload colors && colors

export PROMPT="
%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m%{$fg_bold[green]%}%p %{$fg[cyan]%}%~ %{$fg_bold[blue]%}%{$fg_bold[blue]%} % %{$reset_color%}
	%{$fg_bold[blue]%}→ %{$reset_color%} "
export RPROMPT=$'$(vcs_info_wrapper)'

# env
PYTHONDONTWRITEBYTECODE=1

if [ -x /usr/bin/gem ]; then
	export PATH=$PATH:/home/$USER/.gem/ruby/1.9.1/bin
fi
