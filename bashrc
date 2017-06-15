function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function proml {
    PS1="\[\033[35m\][\h@\u:\w\$(parse_git_branch)]$\[\033[0m\] "
}
proml

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

alias a="alias"
alias cp="cp -pi"
alias mv="mv -i"
alias rm="rm -i"
alias l="ls -Fla"
alias ls="ls -Fa"
alias h="history"
alias vim='/usr/bin/vim'
alias perl='/usr/local/bin/perl'
alias less='/usr/bin/less'
alias sudo='sudo -E '
alias ssh='ssh -A'
alias aws='ssh -i ./Desktop/AWS/aws.pem ec2-user@54.65.76.79'
alias jitaku='ssh -i ~/.ssh/id_rsa_home myokota@192.168.1.2'
alias soto='ssh -i ~/.ssh/id_rsa_home myokota@210.136.88.90'
alias idcf='ssh -i .ssh/id_rsa_idcf -p 22 myokota@210.140.101.90'
alias intraspberry="ssh pi@192.168.1.10"
alias exraspberry="ssh -i ~/.ssh/id_rsa_raspberry pi@202.229.202.245"
# git alias
alias gco="git checkout"
alias gci="git commit"
alias gst="git status"
alias gdi="git diff"
alias gbr="git branch"
alias gh="git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"

calc(){ awk "BEGIN{ print $* }" ;}

export CVS_RSH=ssh
export CVSEDITOR=vim
export SVN_EDITOR=vim
export IGOR_EDITOR=vim
export NLS_LANG=American_Japan.AL32UTF8
export NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS'
export JAVA_HOME=`/usr/libexec/java_home`
set PAGER="lv"
LESSCHARSET=utf-8; export LESSCHARSET
PATH=$HOME/.nodebrew/current/bin:/opt/local/bin:/opt/local/sbin:/Developer/usr/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$HOME/bin:$HOME/.anyenv/bin; export PATH
eval "$(anyenv init -)"
