
# Helping functions {{{
exist () { command -v "${1}" &> /dev/null }
sourcex () { source "${1}" 2> /dev/null || return 0 }
# }}}

# ## History file configuration
# [ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
# [ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
# [ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

# Launch tmux on startup {{{
if exist tmux && [[ -z "${TMUX}" ]]; then
  if ! tmux has-session -t startup 2> /dev/null; then
    tmux new-session -s startup -n main
  else
    tmux attach-session -t startup
  fi
fi
# }}}


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/dot_files/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme


# Completion {{{
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit
zmodload zsh/complist
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:*:*:descriptions' format '%F{yellow}%B-- %d --%b%f'
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-${ZSH_VERSION}"
_comp_options+=(globdots)
# }}}


export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# ----------------------  alias ----------------------


alias d="docker"
alias dx="docker exec"
alias dp="docker ps"
alias di="docker images"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcs="docker compose stop"
alias dcr="docker compose restart"
alias dl="docker logs"

alias gch="git checkout"
alias gc="git commit"
alias gs="git status"
alias gr="git restore"
alias gst="git stash"
alias ga="git add"
alias gf="git fetch"
alias gp="git pull"

alias graph="go run github.com/99designs/gqlgen@v0.17.5 generate"

# ----------------------  External Enviromental variables ----------------------

#Go
# export GOROOT="/usr/local/go/bin"
# export GOPATH="$HOME/go/bin"
# export PATH=$PATH:$GOROOT:$GOPATH
export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/go/bin:$GOPATH/bin"

#sql-client
export LDFLAGS="-L/usr/local/opt/mysql-client/lib"
export CPPFLAGS="-I/usr/local/opt/mysql-client/include"

# ----------------------  General Enviromental variables ----------------------

alias ls2="exa --tree --level=2"
alias ls="exa"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias rm="rm -rf"

