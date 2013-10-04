git filter-branch --commit-filter '
        if [ "$GIT_COMMITTER_NAME" = "root" ];
        then
                GIT_COMMITTER_NAME="Eivind Magnus Hvidevold";
                GIT_AUTHOR_NAME="Eivind Magnus Hvidevold";
                GIT_COMMITTER_EMAIL="hvidevold@gmail.com";
                GIT_AUTHOR_EMAIL="hvidevold@gmail.com";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD
