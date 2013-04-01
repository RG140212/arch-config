# import script for git prompt
source $HOME/.zshlib/git.zsh

export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt inc_append_history
setopt share_history

# disable annoying stuff
unsetopt autocd beep nomatch notify

# enable useful features
setopt extendedglob # autocomplete with regex

# emacs mode
bindkey -e

# configure autocompletion
zstyle :compinstall filename '/home/$USER/.zshrc'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==01}:${(s.:.)LS_COLORS}")'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

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
alias ct='urxvt >3 &'
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
