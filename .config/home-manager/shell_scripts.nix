{ pkgs }:

{
    (pkgs.writeShellScriptBin "my-hello" ''
        echo "Hello, ${config.home.username}!"
    '')

    (pkgs.writeShellScriptBin "aws-profile-switcher" ''
        #!/usr/bin/env bash

        if [[ $# -eq 1 ]]; then
            selected=$1
        else
            selected=$(aws configure list-profiles | fzf-tmux -p --reverse)
        fi

        if [[ -z $selected ]]; then
            exit 0
        fi

        export AWS_PROFILE=$selected
        aws sso login --profile $AWS_PROFILE
        echo $AWS_PROFILE
    '')

    (pkgs.writeShellScriptBin "clone-for-worktress" ''
        #!/usr/bin/env bash
        set -e

        # Examples of call:
        # git-clone-bare-for-worktrees git@github.com:name/repo.git
        # => Clones to a /repo directory
        #
        # git-clone-bare-for-worktrees git@github.com:name/repo.git my-repo
        # => Clones to a /my-repo directory

        url=$1
        basename=${url##*/}
        name=${2:-${basename%.*}}

        mkdir $name
        cd "$name"

        # Moves all the administrative git files (a.k.a $GIT_DIR) under .bare directory.
        #
        # Plan is to create worktrees as siblings of this directory.
        # Example targeted structure:
        # .bare
        # main
        # new-awesome-feature
        # hotfix-bug-12
        # ...
        git clone --bare "$url" .bare
        echo "gitdir: ./.bare" > .git

        # Explicitly sets the remote origin fetch so we can fetch remote branches
        git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

        # Gets all branches from origin
        git fetch origin
    '')

}
