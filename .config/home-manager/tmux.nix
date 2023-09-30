{ pkgs }:

let
    # isDarwin = pkgs.stdenv.isDarwin;
    # kube-tmux = pkgs.tmuxPlugins.mkTmuxPlugin {
    #     pluginName = "kube-tmux";
    #     version = "unstable-2023-01-06";
    #     src = pkgs.fetchFromGitHub {
    #         owner = "jonmosco";
    #         repo = "kube-tmux";
    #         rev = "c127fc2181722c93a389534549a217aef12db288";
    #         sha256 = "sha256-PnPj2942Y+K4PF+GH6A6SJC0fkWU8/VjZdLuPlEYY7A=";
    #     };
    # };
in {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    mouse = true;
    prefix = "C-b";
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    # terminal = if isDarwin then "screen-256color" else "xterm-256color";
    sensibleOnTop = true;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          # Specify Resurrect directory
          # set -g @resurrect-dir '~/.config/tmux/resurrect'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
      {
        plugin = tmuxPlugins.nord;
        # plugin = tmuxPlugins.catppuccin;
      }
      # {
      #   plugin = kube-tmux;
      #   extraConfig = ''
      #       set -g status-right "#(/bin/bash ${kube-tmux} 250 red cyan)"
      #   '';
      # }
      # {
      #   plugin = tmuxPlugins.dracula;
      #   extraConfig = ''
      #     # available plugins: battery, cpu-usage, git, gpu-usage, ram-usage, network, network-bandwidth, network-ping, weather, time
      #     set -g @dracula-plugins "git cpu-usage gpu-usage ram-usage network network-bandwidth network-ping weather time"
      #
      #     # Config Dracula Theme
      #     set -g @dracula-show-powerline true
      #     set -g @dracula-show-flags true
      #     set -g @dracula-military-time true
      #     set -g @dracula-show-fahrenheit false
      #   '';
      # }
      {
        plugin = tmuxPlugins.vim-tmux-navigator;
      }
    ];
    extraConfig = ''
    # set-option -sa terminal-overrides ",xterm*:Tc"
    #
    # unbind C-j
    # unbind C-k
    #
    # split panes using | and -
    bind | split-window -h
    bind - split-window -v
    unbind '"'
    unbind %
    #
    # reload config file (change file location to your the tmux.conf you want to use)
    bind r source-file ~/.config/tmux/tmux.conf
    #
    # # switch panes using Alt-arrow without prefix
    # bind -n M-h select-pane -L
    # bind -n M-l select-pane -R
    # bind -n M-k select-pane -U
    # bind -n M-j select-pane -D
    #
    # clipboard off
    set -g set-clipboard off
    set-option -g default-command "reattach-to-user-namespace -l zsh"
    bind-key -T copy-mode MouseDragEnd1Pane send -X copy-pipe-and-cancel "pbcopy"
    bind P paste-buffer
    bind -T copy-mode-vi v send -X begin-selection
    bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
    set-window-option -g mode-keys vi
    set -g status-keys vi
    #
    # tmux-sessionize
    bind-key -r f run-shell "tmux neww ~/.local/bin/tmux-sessionizer"
    bind-key -r a run-shell "tmux neww ~/.local/bin/tmux-fzf-sessions"
    bind-key -r w run-shell "tmux neww -n temporary ~/.local/bin/tmux-fzf-windows"
    #
    # # don't rename windows automatically
    # set-option -g allow-rename off

    # esc timing
    set -sg escape-time 10

    # scrollback buffer size
    set -g history-limit 50000
    '';
}
