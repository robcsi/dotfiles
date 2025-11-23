source /usr/share/instantshell/zshrc

# Initialize completion system explicitly after zimfw loads
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qNmh+24) ]]; then
  compinit
else
  compinit -C
fi

# set vi mode for shell (after completion initialization)
set -o vi

export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH

# generic aliases
alias ls='eza -alHm --git --group-directories-first'
alias vim='nvim'

# docker aliases
alias dis='docker images'
alias dcs='docker container ls -a'
alias dcp='docker container ps'
alias dirf='docker image rm -f'
alias dcrf='docker container rm -f'

# git aliases for faster operation
alias gp='git push'
alias gg='git pull'
alias gd='git diff'
alias gs='git status'
alias gc='git commit -m'
alias gca='git commit -am'
alias ga='git add'
alias gsh='git show'
alias gap='git add -p'
alias gl='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias gfa='git fetch --all'
alias gb='git branch'
alias gba='git branch --all'
alias gsw='git switch'
alias grs='git restore'

# aliasing vifm to vifm with ueberzug
alias vifm='vifmrun'

#tmux aliases
TMUX_CONFIG="~/.tmux.conf"
tn="tmux -u -f $TMUX_CONFIG new"
ta="tmux -u -f $TMUX_CONFIG attach"
tt="nvim $TMUX_CONFIG"

#tokei/sloc
alias sloc="tokei"

# v = nvim
alias v='nvim'

eval "$(atuin init zsh)"

#source /home/siar/.config/broot/launcher/bash/br

export RUST_WRAPPER=sccache

