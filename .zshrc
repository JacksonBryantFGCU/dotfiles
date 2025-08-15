# ----- Speed: P10k instant prompt (keep at top) -----
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ----- Oh My Zsh -----
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins:
# - Keep it lean. Load highlighting LAST.
plugins=(
  git
  history
  sudo
  dirhistory
  zsh-autosuggestions
  web-search
  zsh-syntax-highlighting
)

fzv() {
  local file
  file=$(fzf --bind 'enter:execute(nvim {})')
  if [[ -n "$file" ]]; then
    nvim "$file"
  fi
}

source $ZSH/oh-my-zsh.sh

# ----- Locale (safe default) -----
export LANG=en_US.UTF-8

# ----- PATH -----
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# ----- Completion: faster, nicer, cached -----
autoload -Uz compinit
# Use a cached compdump to speed up shell start
if [ -n "$ZSH_COMPDUMP" ]; then
  compinit -d "$ZSH_COMPDUMP"
else
  compinit -C
fi

zmodload zsh/complist
setopt AUTO_MENU COMPLETE_IN_WORD
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*'  # smart fuzzy-ish
zstyle ':completion:*' rehash true
# Colorize completion lists using LS_COLORS if available
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi

# ----- History: bigger, deduped, shared -----
HISTFILE=~/.zsh_history
HISTSIZE=500000
SAVEHIST=500000
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_IGNORE_SPACE
setopt SHARE_HISTORY INC_APPEND_HISTORY EXTENDED_HISTORY

# ----- fzf integration (works for both installer or apt) -----
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
else
  # Debian/Ubuntu package drops examples here:
  if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
  fi
  if [ -f /usr/share/doc/fzf/examples/completion.zsh ]; then
    source /usr/share/doc/fzf/examples/completion.zsh
  fi
fi

# ----- zoxide (you already use it) -----
eval "$(zoxide init zsh)"

# ----- Aliases / WSL interop helpers -----
# Ubuntu renames bat to batcat
command -v batcat >/dev/null 2>&1 && alias bat='batcat'
# Better ls (if you installed lsd)
command -v lsd >/dev/null 2>&1 && alias ls='lsd' && alias ll='ls -la'
# Open things in Windows default app (needs wslu: sudo apt install wslu)
command -v wslview >/dev/null 2>&1 && alias open='wslview'
# Copy to Windows clipboard
command -v clip.exe >/dev/null 2>&1 && alias copy='clip.exe'

# ----- Editor preference -----
export EDITOR='nvim'
export VISUAL='nvim'

export PATH="$HOME/.cargo/bin:$PATH"

# ----- Safe tmux auto-attach (interactive only) -----
if [ -t 1 ] && [ -z "$TMUX" ] && command -v tmux >/dev/null 2>&1; then
  tmux attach -t main 2>/dev/null || tmux new -s main
fi

# ----- Powerlevel10k config -----
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Show neofetch at shell startup (only if interactive)
[[ $- == *i* ]] && command -v neofetch >/dev/null && neofetch
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
