alias ll='ls -alh --color'
alias la='ls -Alh --color'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias push='git push'
alias st='git status'
alias unstage='git reset HEAD '
alias revert='git checkout -- '
alias tidy='~/dgkimpton/git_prune_local.sh'

if test -f ~/dgkimpton/ssh-key-list; then
	eval "$(ssh-agent -s)"
	keys=$(cat ~/dgkimpton/ssh-key-list)
	for key in $keys
	do
		ssh-add "${key/\~/$HOME}"
	done
fi

function prep() {
    local rootpath=$(git rev-parse --show-toplevel)
    local branch=$(git rev-parse --abbrev-ref HEAD)
    mkdir -p ${rootpath}/commits/${branch}
    rm -f ${rootpath}/commits/${branch}.msg
    vim -f ${rootpath}/commits/${branch}.msg
}

function commit() {
    local rootpath=$(git rev-parse --show-toplevel)
    local branch=$(git rev-parse --abbrev-ref HEAD)
    cd ${rootpath}
    git commit -F${rootpath}/commits/${branch}.msg -e
}

function git_branch() {
    local branchtype=$1
    local branchname=$2
    git checkout -b ${branchtype}/${branchname}
}

function feature() {
    git_branch feature $1
}

function fix() {
    git_branch fix $1
}

function pushup() {
    local branch=$(git rev-parse --abbrev-ref HEAD)
    git push --set-upstream origin ${branch}
}







