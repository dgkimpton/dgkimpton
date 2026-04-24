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

git_parse_branch() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ $branch != "" ]]; then echo "($branch)"; else echo ""; fi
}
get_time() {
	local time=`date +'%H:%M'`
	local username=`whoami`
	printf %-${#username}s "$time"
}

PS1='\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[35m\] `git_parse_branch`\n\[\033[90m\]`get_time`\[\033[32m\]└─▶\[\033[0m\] $ '


export XDG_RUNTIME_DIR=/run/user/$(id -u)
export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock
export SCW_DEFAULT_REGION="nl-ams"
export SCW_DEFAULT_ZONE=nl-ams-1

is_interactive() {
    # true if shell is interactive
    case $- in *i*) : ;; *) return 1 ;; esac
    # also require a real TTY (stdin & stdout)
    [ -t 0 ] && [ -t 1 ]
}

as_wet() {
    CLI_CRED="op://ServiceTokens/CLI-Wet-RW/credential"

    if ! is_interactive; then
        printf >&2 "Refusing to run: shell is non-interactive (or no TTY)\n"
    return 2
    fi

    local OP_BIN="$(command -v op)" || { echo "op not found" >&2; return 127; }
    case "$OP_BIN" in /usr/bin/op|/usr/local/bin/op) ;; *)
    echo "Refusing untrusted op at $OP_BIN" >&2; return 1 ;;
    esac

    eval "$($OP_BIN signin)"
    local token; token=$($OP_BIN read "$CLI_CRED")
    $OP_BIN signout
    unset OP_BIN

    export OP_ACCOUNT_TOKEN="$token"
}

wenv() {
  local tok="${OP_SERVICE_ACCOUNT_TOKEN:-${OP_ACCOUNT_TOKEN:-}}"
                : "${tok:?Set OP_SERVICE_ACCOUNT_TOKEN (or run as_wet first)}"
  OP_SERVICE_ACCOUNT_TOKEN="$tok" op run --env-file="$1" -- "${@:2}"
}
export -f wenv

wread() {
  local tok="${OP_SERVICE_ACCOUNT_TOKEN:-${OP_ACCOUNT_TOKEN:-}}"
                : "${tok:?Set OP_SERVICE_ACCOUNT_TOKEN (or run as_wet first)}"
  OP_SERVICE_ACCOUNT_TOKEN="$tok" op read "$@"
}
export -f wread


wupdate() {
  local tok="${OP_SERVICE_ACCOUNT_TOKEN:-${OP_ACCOUNT_TOKEN:-}}"
                : "${tok:?Set OP_SERVICE_ACCOUNT_TOKEN (or run as_wet first)}"
  OP_SERVICE_ACCOUNT_TOKEN="$tok" op item edit --vault=wet "$@"
}
export -f wupdate


as_none() {
  unset OP_ACCOUNT_TOKEN
}


github() {
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/github
}

# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=bash)"
