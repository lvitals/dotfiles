#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

### Add Git Status to bash prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\u@\h \[\033[36m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\n$ "
#PS1='[\u@\h \W]\$ '

PROMPT_COMMAND='echo -en "\033]0;$(pwd -P)\a"'
