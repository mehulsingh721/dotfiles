# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

#Create and enter a directory
mkcd () {
  mkdir "$1"
  cd "$1"
}

#compile and run C program
run () {
  gcc "$1"
  ./a.out
}

alias vim="nvim"
alias activate="source ~/env/bin/activate"
alias ls='ls --color=auto -I node_modules '

#recieve keys
alias receive-key='gpg --keyserver hkp://keys.gnupg.net:80 --recv-keys'

#mpv autosave
alias mpv='mpv --save-position-on-quit'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'
alias clone='git clone https://github.com/mehulsingh072001/"$1"'

#C boiler plate
alias boilit='mkcd source && touch main.c'

#suspend
alias down='systemctl suspend'
alias record='ffmpeg -f x11grab -video_size 1920x1080 -framerate 25 -i $DISPLAY -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac'
alias site='/usr/bin/git --git-dir=$HOME/wordpress-sites --work-tree=$HOME'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

neofetch
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/tools/bin/
export PATH=$PATH:$ANDROID_HOME/tools/
PATH=$ANDROID_HOME/emulator:$PATH
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
