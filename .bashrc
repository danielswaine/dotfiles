# Test for non-interactive shells
[[ $- == *i* ]] || return 0

# Load bits
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(rbenv init -)"
export PATH=/usr/local/bin:$PATH


# Open man page as PDF
function manpdf() {
 man -t "${1}" | open -f -a /Applications/Preview.app/
}

# Create a new directory and enter it
function mk() {
  mkdir -p "$1" && cd "$1"
}

# Change into the top-most Finder window's location
function cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# With no arguments opens the current directory in Atom, otherwise
# opens the given location
function a() {
	if [ $# -eq 0 ]; then
		atom .
	else
		atom "$@"
	fi
}


# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Folder shortcuts
alias dx="cd ~/Dropbox"
alias dt="cd ~/Desktop"
alias pr="cd ~/Projects"

alias c="clear"
alias ls="ls -lsG"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Ring the terminal bell, and put a badge on Terminal’s Dock icon
alias badge="tput bel"

# Parse current branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


# Custom Prompt
PROMPT_COMMAND='custom_prompt'
custom_prompt() {
   exit_code=$?

   bash_version=$(echo $BASH_VERSION | sed -e 's/\([0-9.]*\)(.*/\1/')
   window_title="Bash $bash_version  –  $(pwd | grep -o '[^/]\+$')"
   msg=${debian_chroot:+($debian_chroot)}

   if [[ $exit_code -ne 0 ]]; then
       msg="\[\e[31m\] ✘ exit $exit_code\[\e[0m\]\n$msg"
   fi

   reset_colour="\[\e[0m\]"
   date="\[\e[32m\][\d \$(date +%k:%M:%S)] "
   user="${reset_colour}\u"
   at="\[\e[97m\]@"
   host="\[\e[36m\]\h "
   git="\[\e[32m\]$(parse_git_branch)"
   dir="\[\e[33m\]\w${git} \[\e[33m\]❯ "

   PS1="${msg}${date}${user}${at}${host}${dir}${reset_colour}"

   echo -n -e "\033]0;$window_title\007"
}


# For fun
random=$(echo $((RANDOM%2)))
if [[ $random -eq 0 ]]; then
  if which fortune cowsay lolcat &> /dev/null; then
      fortune -s | cowsay -f tux | lolcat -F 0.5
      echo
  fi
else
  if which figlet lolcat &> /dev/null; then
      hour=$(date +"%H")
      if [ $hour -ge 0 -a $hour -lt 12 ]; then
        greeting="good morning"
      elif [ $hour -ge 12 -a $hour -lt 18 ]; then
        greeting="good afternoon"
      else
        greeting="good evening"
      fi
      figlet -f ogre -w 150 $greeting $USER | lolcat -F 0.5
      echo
  fi
fi
