{ pkgs }:

{
  # todo:
  # x ~/.p10k.zsh.
  # x autoswitch_virtualenv
  # x set history
  # x compare .zshrc files
  # - gnupg2.2 !?
  # - openssl3 !?
  # - kube-ps1 prompt
  # x kubectl autocomplete
  # - google cloud paht + autocomplete
  # - terraform completions
  # x autoload -U +X bashcompinit && bashcompinit # for aws?
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "autoswitch_virtualenv";
        src = pkgs.fetchFromGitHub {
          owner = "MichaelAquilina";
          repo = "zsh-autoswitch-virtualenv";
          rev = "3.6.0";
          sha256 = "sha256-h6m5HFU6pQ63CzvQpao6tj2Lk9r180N83Sj+HpL042w=";
        };
      }
    ];
    localVariables = {
      GPG_TTY = "$TTY";
    };
    initExtra = ''
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      source ~/.p10k.zsh
      gw () {
        local out
        out=$(
          git worktree list |
          fzf-tmux -p --header Worktree --reverse  --preview='git log --oneline -n10 {2}' |
          awk '{print $1}'
        )
        cd $out
      }
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [
        "aws"
        "docker"
        "fd"
        "fzf"
        "git"
        "helm"
        "kube-ps1"
        "kubectl"
        "kubectx"
        "ripgrep"
        "rust"
        "pip"
        "poetry"
        "terraform"
        "vi-mode"
        "virtualenv"
        "z"
        "zoxide"
        "zsh-interactive-cd"
      ];
      # theme = "powerlevel10k";
    };
    shellAliases = {
      vimdiff = "nvim -d";
      k = "kubectl";
      d = "docker";
      dc = "docker compose";
      g = "git";
      gs = "git status -s";
      gb = "git branch --sort=-committerdate | fzf-tmux -p --reverse --header Checkout --preview 'git diff {-1} --color=always' --pointer='' | tr -d '+*' | xargs git checkout";
      gwa = "git worktree add";
      v = "nvim";
      cat = "bat";
      dotfiles = "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME";
      f = "fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim";
      ls = "exa";
      lsa = "ls --icons --long --git --extended --all --header --group-directories-first";
      cht = "tmux-cht.sh";
      awsctx = "source ~/.local/bin/aws-profile-switcher";
      kctx = "kubie ctx";
      kns = "kubie ns";
    };
    history = {
      extended = true;
      save = 100000;
      size = 100000;
    };
}
