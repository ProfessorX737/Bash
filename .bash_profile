#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  System Operations & Information
#  8.  Web Development
#  9.  Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

# Colors
black="\[$(tput setaf 0)\]"
red="\[$(tput setaf 1)\]"
green="\[$(tput setaf 2)\]"
yellow="\[$(tput setaf 3)\]"
blue="\[$(tput setaf 4)\]"
magenta="\[$(tput setaf 5)\]"
cyan="\[$(tput setaf 6)\]"
white="\[$(tput setaf 7)\]"

printl () {
    cols=$(tput cols)
    for i in `seq 1 $cols`
    do
        echo -n "_"
    done
    echo ""
}

# custom prompt
export 
PS1="${green}$(printl)${magenta}\w${cyan}\$(git_name_filter)\n${green}➜ ${white} "

# Clear attributes
clear_attributes="\[$(tput sgr0)\]"

export CLICOLOR=1

#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

user () {
   echo $(whoami) | sed 's/ /\\ /g'
} 

# common commands
alias clc='clear'                           # Clear terminal
alias c='clear'                             # Clear terminal
alias ~='cd ~'                              # Go Home
alias h='cd ~'                              # Go Home
alias rh='cd /'				    # Go to root home
alias rc="cd C:/Users/$(user)"              # Go to C drive home
alias rd="cd D:/Users/$(user)"	   	    # Go to D drive home
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias e='edit'                              # edit file using default editor

# git aliases
alias urlgit='git config --get remote.origin.url'   # print current git repo url
alias lsgit='git ls-tree -r master --name-only'     # list all tracked files by git from master branch
alias sgit='git status'                             # show git status
alias acp='lazygit'                                 # add, commit, push

trash () { command mv "$@" ~/.Trash ; }  

# cd into directory and list files
cdl () {
    cd "$1"
    ls
}

# make git easier
function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}

# get git branch put in brackets
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)\ /';
}

# print git repo url of the current directory
function urlgit () {
    git config --get remote.origin.url
}

git_repo_name() {
    dir=$(basename $(urlgit) '.git')
    if [ "$dir" != ".git" ]; then
        echo "$dir"
    fi
}

git_repo_branch() {
    if [ ! -z "$(git_repo_name)" ]; then
        echo "$(git_repo_name)$(git_branch)"
    fi
}

git_name_filter () {
    if [[ ( "$(basename $(pwd))" != "$(git_repo_name)" ) || ( "$(basename $(pwd))" = "$(basename $HOME)" ) ]]; then
        echo " $(git_repo_branch)"
    else 
        echo $(git_branch)
    fi
}

#   -------------------------------
#   3. FILE AND FOLDER MANAGEMENT
#   -------------------------------

alias numf='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir

#   ---------------------------
#   4. SEARCHING
#   ---------------------------

# search for previous commands based on initial command fragment given
bind '"\e[A":history-search-backward'       # <up-arrow>
bind '"\e[B": history-search-forward'       # <down-arrow>

ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

#   ---------------------------
#   6. NETWORKING
#   ---------------------------

#   ---------------------------------------
#   8. WEB DEVELOPMENT
#   ---------------------------------------

#   ---------------------------------------
#   9. REMINDERS & NOTES
#   ---------------------------------------
