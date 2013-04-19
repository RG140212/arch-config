setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%f%s%F{3}:%F{6}(%F{1}%b%F{6})%f '
zstyle ':vcs_info:*' formats       \
    '%f%s%F{3}:%F{6}(%F{1}%b%F{6})%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg_bold[blue]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
