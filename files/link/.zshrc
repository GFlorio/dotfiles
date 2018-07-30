# Start tmux session
[ -z "$TMUX"  ] && { tmux new-session -t 0 || exec tmux new-session && exit;}

#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh
# User configuration

source ~/.zsh_start/kube_autocomplete.zsh
source /etc/profile.d/apps-bin-path.sh

alias vact='. ~/.venvs/${PWD##*/}/bin/activate'
alias upkey='ssh-copy-id -i ~/.ssh/id_rsa.pub'
alias downsub='ssh homeserver "cd Downloads/Movies && ./sub.py"'
alias cpy='xclip'
alias pst='xclip -o'
