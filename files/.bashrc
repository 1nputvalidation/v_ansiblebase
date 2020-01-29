export EDITOR= vim

#Prompt
PS1='\h:\w\$ '

##Configs##
 alias bashc='vim ~/.bashrc'
 alias vimc='vim ~/.vimrc'
 alias tmuxc='vim ~/.tmux.conf'
 alias hosts='sudo vim /etc/hosts'
 alias inet='ifconfig | grep inet | grep -v -E '\''inet6|127'\''; cat /etc/resolv.conf | grep nameserver; curl ipecho.net/plain ; echo'

##History##
# configure a larger history backlog and filesize
HISTSIZE=5000
HISTFILESIZE=10000

# configure timestamp to display when `history` command is run
HISTTIMEFORMAT="%d/%m/%Y %T "

# enable history appending when session ends
shopt -s histappend

# append, clear and reload history for current session each time prompt refreshes
# this enables commands to be shared between sessions of the same user
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export HISTSIZE HISTFILESIZE HISTTIMEFORMAT PROMPT_COMMAND

##misc##
 alias l='ls -la'
 alias c='clear'
 alias ccc='cd && clear'
 alias vi='vim'
 alias du='du -sh * | sort -n'
 alias sduo='sudo'

##IPTables##
alias iptrunning='watch --interval 0 -x exec(iptables -nvL | grep -v "0     0")'
alias ipt='sudo /sbin/iptables'
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'

##Podman##
alias wipepod='podman rm $(podman ps -a -q)'

function vbk() {
     echo "You are making a copy of $1 before you open it. Press enter to continue.";
     read null;
     cp $1 $1.old;
     vim $1;
}