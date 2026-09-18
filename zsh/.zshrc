 [[ -n "$SSH_CONNECTION" && -z "$COLORTERM" ]] && export COLORTERM=truecolor

# Pin Claude Code to the 1M-context Opus 4.8 (settings.json strips the [1m] variant on restart)
export ANTHROPIC_MODEL='claude-opus-4-8[1m]'

# instantshell was uninstalled 2026-09-10; it used to source this. Loads autosuggestions,
# syntax-highlighting, fzf-tab, zsh-completions, zoxide. Prompt now comes from starship (end of file).
export ZIM_HOME=${HOME}/.zim   # required by zimfw (build/update/upgrade)
[[ -e ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# Initialize completion system explicitly after zimfw loads.
# Full compinit (slow, rescans fpath) only if the dump is missing or >24h old;
# otherwise use the cached dump. Note: the glob must be in an array assignment --
# [[ ]] does not perform filename generation, so a glob there is a literal string.
autoload -Uz compinit
() {
  setopt localoptions extendedglob
  local -a fresh=(${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh-24))
  if (( $#fresh )); then compinit -C; else compinit; fi
}

# set vi mode for shell (after completion initialization).
# bindkey -v, not `set -o vi`: the latter sets the `vi` OPTION, which zargs'
# _zarun replays via `emulate -l` in workers that have no line editor, emitting
# "can't change option: vi" once per module during zimfw updates.
bindkey -v

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
alias j='z'

#tmux aliases
TMUX_CONFIG="~/.tmux.conf"
tn="tmux -u -f $TMUX_CONFIG new"
ta="tmux -u -f $TMUX_CONFIG attach"
tt="nvim $TMUX_CONFIG"

#tokei/sloc
alias sloc="tokei"

# v = nvim
alias v='nvim'

#jenkins jcli source alias
jc() {
  source ~/.jenkins.env || return 1
  jenkins-cli "$@"
}

eval "$(atuin init zsh)"

#source /home/siar/.config/broot/launcher/bash/br


# prompt
eval "$(starship init zsh)"
