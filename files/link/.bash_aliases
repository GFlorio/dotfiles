# My aliases
alias upkey='ssh-copy-id -i ~/.ssh/id_rsa.pub'
alias cpy='xclip -selection clipboard'
alias pst='xclip -o -selection clipboard'
alias pstrun='$(pst)'
alias notes='gvim ~/notes.md'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

alias man='tldr find'
alias reallyman=man

alias genpass='head /dev/urandom | tr -dc "A-Za-z0-9!#$%&*+,-./:;<=>?@[\]^_{|}~" | head -c20'

alias l='ls -l'
alias la='ls -la'
alias ll='ls -alF'

cl() {
   cd $1
   ls -la
}
mkcd() {
   mkdir -p $1
   cd $1
}

alias ga='git add --all'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gcm='git commit -m'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gd='git diff'
alias gpl='git pull'
alias gpsh='git push origin $(git branch --show-current)'
alias gpshu='git push -u origin $(git branch --show-current)'
alias glog='git log --oneline --decorate --graph --all'
alias gss='git status -s'
alias ghash='git rev-parse --short HEAD'

alias k='kubectl'
alias kgp='kubectl get pods'
alias argo="kubectl get service -n argocd --selector=app.kubernetes.io/name=argocd-server -o jsonpath='{.items[].status.loadBalancer.ingress[0].ip}'"

declare -A clusters
clusters[stg]="stg-roonlabs-1-roon --region us-east1 --project roon-stg-roonlabs-1-90fc"
clusters[prd]="prd-roonlabs-1-roon --region us-east1 --project roon-prd-roonlabs-1-c5c7"
clusters[shr]="prd-sharedservices-1-global --region us-east1 --project prd-sharedservices-1"

function gke {
    gcloud container clusters get-credentials ${clusters[$1]}
}


alias clean_root='sudo journalctl --vacuum-time=10d && sudo apt clean && sudo apt autoclean'
alias mssql-server="docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=mssql-labs1' -p 1433:1433 --name sql1 -v /home/labuser/dockervolumes/lab01:/var/opt/mssql -d microsoft/mssql-server-linux:2017-latest"
# keytool -printcert -jarfile launcher.apk | grep -Po "(?<=SHA256:) .*" | xxd -r -p | openssl base64 | tr -d '=' | tr -- '+/=' '-_'
