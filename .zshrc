# zsh settings I actually use, on macOS and Linux.

# History: keep a lot of it, share it across open sessions, skip dupes.
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

# Paths: personal bins first, then the usual system locations.
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"

export EDITOR=vim
export PAGER=less

# Completion: case-insensitive matching for lowercase input.
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Prompt: directory plus git branch, nothing fancy.
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{green}%~%f${vcs_info_msg_0_} $ '

# Aliases I use daily.
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status -sb'
alias gl='git log --oneline --decorate -15'
alias gd='git diff'
alias gco='git checkout'
alias gp='git pull --ff-only'
alias listen='lsof -i -P -n | grep LISTEN'
alias reload='source ~/.zshrc'
