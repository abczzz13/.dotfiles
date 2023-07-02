{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "thomasdejong";
  home.homeDirectory = "/Users/thomasdejong";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.awscli2
    pkgs.cmatrix
    pkgs.cookiecutter
    pkgs.curl
    # pkgs.docker # need to use docker-desktop on m1!?
    pkgs.du-dust
    pkgs.fd
    pkgs.gnused
    pkgs.htop
    pkgs.just
    pkgs.kubernetes-helm
    pkgs.libpqxx # for postgresql on m1
    pkgs.minikube
    pkgs.nmap
    pkgs.openssl
    pkgs.parallel
    pkgs.pipx
    pkgs.postgresql
    pkgs.sops
    pkgs.sqlite
    pkgs.stern
    pkgs.terraform
    pkgs.terragrunt
    # pkgs.tree-sitter
    pkgs.unixtools.procps
    pkgs.wget

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/thomasdejong/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.jq.enable = true;
  programs.less.enable = true;
  programs.man.enable = true;
  programs.ripgrep.enable = true;

  programs.alacritty = {
    enable = true;
    settings = lib.attrsets.recursiveUpdate (import ./alacritty.nix) {};
  };


  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = ["--disable-up-arrow"];
    settings = {
      style = "compact";
      inline_height = 30;
    };
  };

  programs.bat = {
    enable = true;
    config = {
      pager = "less";
      theme = "ansi";
      style = "numbers,changes,header";
      italic-text = "always";
    };
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
    git = false;
    icons = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
      "--long"
      "--extended"
      "--color"
    ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    fileWidgetCommand = "fd --type f --no-ignore";
    historyWidgetOptions = [ "--reverse" "--sort" "--exact" ];
    tmux = {
      enableShellIntegration = true;
    };
  };

  programs.rtx = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      tools = {
        node = ["20"];
        python = ["3.8" "3.9" "3.10" "3.11"];
        };
      settings = {
        verbose = true;
        experimental = false;
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # To be configured:
  # programs.direnv.enable = true;
  # programs.git.enable = true;
  # programs.git.delta.enable = true;
  # programs.gpg.enable = true;
  # programs.neovim.enable = true;
  # programs.ssh.enable = true;
  # programs.tmux.enable = true;
  # programs.zsh.enable = true;
  # programs.zsh.oh-my-zsh.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
