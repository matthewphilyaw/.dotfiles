PS1="[\u@\H] \W $ "
export export CLICOLOR=1
export LSCOLORS=Dxbxcxdxcxegedabagacad
export PATH=/usr/local/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules
export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
defaults write com.sublimetext.2 ApplePressAndHoldEnabled -bool false

PS1="\n(\u)-(jobs:\j)-(\w)-(!\!)\n-> "
PS2="-> "

alias l="ls -l"
alias ll="ls -la"
