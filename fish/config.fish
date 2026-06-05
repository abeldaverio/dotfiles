if status is-interactive
# Commands to run in interactive sessions can go here
alias z="zed ."
alias zed=zeditor
end
#Kic bin path
export PATH="$PATH:/home/abel/repos/k8s_infra_minimal/bin/linux/"
export RC="~/.config/fish/config.fish"
#Kic alias
alias kic=k8s_infra_cli
#K8s infra path
export KIC_WORKING_DIRECTORY="/home/abel/repos/k8s_infra_minimal"

pyenv init - fish | source
pyenv virtualenv-init - fish | source
export PATH="$HOME/development/flutter/bin:$PATH"
