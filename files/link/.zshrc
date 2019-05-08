# Start tmux session
[ -z "$TMUX"  ] && { tmux new-session -t 0 || exec tmux new-session && exit;}

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="spaceship"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git django)

source $ZSH/oh-my-zsh.sh 
source /etc/profile.d/apps-bin-path.sh 

alias vact='. ~/.venvs/${PWD##*/}/bin/activate'
alias mkvenv='python3 -m venv ~/.venvs/${PWD##*/}'
alias upkey='ssh-copy-id -i ~/.ssh/id_rsa.pub'
alias downsub='ssh homeserver "cd Downloads/Movies && ./sub.py"'
alias cpy='xclip'
alias pst='xclip -o'
alias restart-plasmashell='killall plasmashell; nohup plasmashell& disown'
if [ /snap/bin/kubectl ]; then source <(kubectl completion zsh); fi
