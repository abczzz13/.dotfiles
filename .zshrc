if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export GPG_TTY=$TTY
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git poetry autoswitch_virtualenv zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

HISTTIMEFORMAT="%Y-%m-%d %T "
export PATH="/opt/homebrew/opt/gnupg@2.2/bin:$PATH"

# bindkey "^[b" backward-word
# bindkey "^[f" forward-word
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

export EDITOR="nvim"
export VISUAL="nvim"
alias vimdiff='nvim -d'

# Created by `pipx` on 2022-09-20 11:13:25
export PATH="$PATH:/Users/thomasdejong/.local/bin"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

export KUBECONFIG="$HOME/.kube/configs/eh3-test/config:$HOME/.kube/configs/ehk3-acceptance/config:$HOME/.kube/configs/ehk4-test/config:$HOME/.kube/configs/stembureauapp/config:$HOME/.kube/configs/sba-elements/config"

gw () {
  local out
  out=$(
    git worktree list |
    fzf-tmux -p --header Worktree --reverse  --preview='git log --oneline -n10 {2}' |
    awk '{print $1}'
  )
  cd $out
}

alias k=kubectl
alias d=docker
alias dc=docker compose
alias g=git
alias gs="git status -s"
alias gb="git branch --sort=-committerdate | fzf-tmux -p --reverse --header Checkout --preview 'git diff {-1} --color=always' --pointer='' | tr -d '+*' | xargs git checkout"
alias gwa="git worktree add"
alias v=nvim
alias cat=bat
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias f="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"
alias lsa="ls -larth"
alias sed=gsed
alias cht="tmux-cht.sh"
alias awsctx="source ~/.local/bin/aws-profile-switcher"


source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
eval "$(zoxide init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/thomasdejong/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/thomasdejong/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/thomasdejong/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/thomasdejong/google-cloud-sdk/completion.zsh.inc'; fi
eval "$(/opt/homebrew/bin/rtx activate zsh)"
eval "$(atuin init zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
