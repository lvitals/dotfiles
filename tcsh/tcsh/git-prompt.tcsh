source $HOME/.tcsh/git-completion.tcsh
source $HOME/.tcsh/colors.tcsh

setenv GIT_BRANCH_CMD "sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'"
set prompt="${white}%n${white}@%m ${cyan}%~ ${green}`$GIT_BRANCH_CMD` \n${white}%#${end} "
