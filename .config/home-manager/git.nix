{ pkgs }:

{
  enable = true;
  userName = "Thomas de Jong";
  userEmail = "thomas.dejong@elements.nl";
  aliases = {
    lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative";
    clone-for-worktrees = "!sh $HOME/.local/bin/clone-for-worktrees";
  };
  delta = {
      enable = true;
      options = {
        chameleon = {
          dark = true;
          line-numbers = true;
          side-by-side = true;
          keep-plus-minus-markers = true;
          syntax-theme = "Nord";
          file-style = "#434C5E bold";
          file-decoration-style = "#434C5E ul";
          file-added-label = "[+]";
          file-copied-label = "[==]";
          file-modified-label = "[*]";
          file-removed-label = "[-]";
          file-renamed-label = "[->]";
          hunk-header-style = "omit";
          line-numbers-left-format = " {nm:>1} │";
          line-numbers-left-style = "red";
          line-numbers-right-format = " {np:>1} │";
          line-numbers-right-style = "green";
          line-numbers-minus-style = "red italic black";
          line-numbers-plus-style = "green italic black";
          line-numbers-zero-style = "#434C5E italic";
          minus-style = "bold red";
          minus-emph-style = "bold red";
          plus-style = "bold green";
          plus-emph-style = "bold green";
          zero-style = "syntax";
          blame-code-style = "syntax";
          blame-format = "{author:<18} ({commit:>7}) {timestamp:^12} ";
          blame-palette = "#2E3440 #3B4252 #434C5E #4C566A";
        };
        features = "chameleon";
        side-by-side = true;
    };
  };
  # delta = {
  #   enable = true;
  #   options = {
  #     line-numbers = true;
  #     side-by-side = false;
  #     file-modified-label = "modified:";
  #     syntax-theme = "gruvbox-dark";
  #     plus-style = "syntax";
  #     minus-style = "syntax";
  #   };
  # };
  signing = {
    key = "276493428D7322D1";
  };
  extraConfig = {
    color.ui = true;
    init.defaultBranch = "main";
    pull.rebase = "true";
    rebase.autoStash = "true";
    push.default = "current";
    commitl.verbose = true;
    # interactive.diffFilter = "delta --color-only";
    diff.tool = "vimdiff";
    difftool.vimdiff.prompt = false;
    core = {
        editor = "nvim";
      };
    merge = {
      tool = "vimdiff";
      conflictStyle = "diff3";
      prompt = false;
      };
    mergetool = {
      keepBackup = false;
      vimdiff = {
        path = "nvim";
      };
    };
  };
}
