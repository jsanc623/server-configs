# .bashrc

user=$(whoami)

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi;



function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\e[00;32m\][\[\e[0m\]\[\e[01;36m\]\u\[\e[0m\]\[\e[00;36m\]@\[\e[0m\]\[\e[01;36m\]\h\[\e[0m\]\[\e[00;37m\] 
\[\e[0m\]\[\e[00;33m\]\W\[\e[0m\]\[\e[00;32m\]]\[\e[0m\]\$(parse_git_branch)\$ \[\e[0m\]"
export LS_COLORS="di=00;91" # Change the directory color
export HISTSIZE=10000 # Increase history size
unset SSH_ASKPASS

git_commit(){
    git commit -m $1
}
git_push(){
    git push origin $1
}
git_pull(){
    git pull origin $1
}
git_merge(){
    git checkout $1
    git pull origin $1
    git checkout $2
    git merge $1
}

alias get="git_pull"
alias push="git_push"
alias hide="git stash"
alias look="git checkout"
alias status="git status"
alias commit="git_commit"
alias merge="git_merge"

alias ls="ls -lah"
alias l="clear && ls -l --almost-all --classify --human-readable --size --dereference --color && echo '' && [ -d .git ] && status"
alias ..="cd ../ && l"

alias nano="nano --smooth --tempfile --tabstospaces -T 4"
alias py="python"
alias run="chmod a+x ./run.sh && ./run.sh"
