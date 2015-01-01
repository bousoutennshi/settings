function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function proml {
    if [ "x$YROOT_NAME" != "x" ]; then
        PS1="\[\033[35m\][\h@\u:\w\$(parse_git_branch) => ($YROOT_NAME)]$\[\033[0m\] ";
    else
        PS1="\[\033[35m\][\h@\u:\w\$(parse_git_branch)]$\[\033[0m\] "
    fi
}
proml

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
set PAGER="lv"
LESSCHARSET=utf-8; export LESSCHARSET
PATH=$ROOT/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$HOME/bin; export PATH
