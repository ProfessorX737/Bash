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

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)\ /';
}

# custom prompt
export PS1="\n${blue}\w ${cyan}\$(git_branch)\n${green}➜${white} "
# ${white}________________________________________________________________________________\n| 
# Clear attributes
clear_attributes="\[$(tput sgr0)\]"

# text color
 export CLICOLOR=1

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

alias clc='clear'                           # Clear terminal
alias c='clear'                             # Clear terminal
alias ~='cd ~'                              # Go Home
alias h='cd ~'                           # Go Home
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

trash () { command mv "$@" ~/.Trash ; }  

# cd into directory and list files
cdl () {
    cd "$1"
    ls
}

# cd into directory and open file
cdo () {
    cd "$1"
    open "$1"
}

# make git easier
function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}

#   -------------------------------
#   3. FILE AND FOLDER MANAGEMENT
#   -------------------------------

alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir

ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

#   ---------------------------
#   4. SEARCHING
#   ---------------------------

bind '"\e[A":history-search-backward'
bind '"\e[B": history-search-forward'

#   ---------------------------
#   6. NETWORKING
#   ---------------------------

#   ---------------------------------------
#   8. WEB DEVELOPMENT
#   ---------------------------------------

#   ---------------------------------------
#   9. REMINDERS & NOTES
#   ---------------------------------------
