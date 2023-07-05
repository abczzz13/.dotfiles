{ config, lib, pkgs, ... }:

let
  git-settings = import ./git.nix { inherit pkgs; };
  tmux-settings = import ./tmux.nix { inherit pkgs; };
  zsh-settings = import ./zsh.nix { inherit pkgs; };
in
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
  home.packages = with pkgs; [
    awscli2
    cmatrix
    cookiecutter
    curl
    # docker # need to use docker-desktop on m1!?
    du-dust
    fd
    gnused
    htop
    just
    kubernetes-helm
    libpqxx # for postgresql on m1
    meslo-lgs-nf
    minikube
    nmap
    openssl
    parallel
    pipx
    postgresql
    sops
    sqlite
    stern
    terraform
    terragrunt
    pkgs.tree-sitter
    unixtools.procps
    wget

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
    EDITOR = "nvim";
    VISUAL = "nvim";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"; # for psycopg2 on m1
    CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"; #
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

  programs.broot = {
    enable = true;
    enableZshIntegration = true;
    settings.modal = true;
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
      "--color=always"
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

  programs.git = git-settings;

  # programs.neovim = {
  #   enable = true;
  #   viAlias = true;
  #   vimAlias = true;
  #   vimdiffAlias = true;
  #   withNodeJs = true;
  #   withPython3 = true;
  #   extraPython3Packages = (p: with p; [
  #     debugpy
  #   ]);
  #   extraLuaConfig = ''
  #     vim.g.mapleader = " "
  #     vim.g.maplocalleader = " "
  #
  #     -- Lazy.nvim setup:
  #     local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  #     if not vim.loop.fs_stat(lazypath) then
  #       vim.fn.system({
  #         "git",
  #         "clone",
  #         "--filter=blob:none",
  #         "https://github.com/folke/lazy.nvim.git",
  #         "--branch=stable", -- latest stable release
  #         lazypath,
  #       })
  #     end
  #     vim.opt.rtp:prepend(lazypath)
  #
  #     require("lazy").setup({ { import = "tdj.plugins" } })
  #     require("tdj")
  #   '';
  # };

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

  programs.tmux = tmux-settings;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  fonts.fontconfig.enable = true;
  programs.zsh = zsh-settings;

  # To be configured:
  # programs.direnv.enable = true;
  # programs.gpg.enable = true;
  # programs.ssh.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
