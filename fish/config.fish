if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias zed=zeditor
export KUBECONFIG=/home/abel/.kube/config
ln -s $HOME/.ghcup/bin/haskell-language-server-wrapper $HOME/.ghcup/bin/haskell-language-server
export PATH="$HOME/.ghcup/ghc/9.8.4/bin:$HOME/.ghcup/bin:$PATH"
