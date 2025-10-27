alias zed="open -a /Applications/Zed.app" # Open a file/directory with: zed [file_name]
alias cd='z'                              # Replaces cd with zoxide
alias cdi='zi'                            # interactive zoxide
alias ls='ls -GlAh'                       # ls with all the info
alias l='/bin/ls -GA'                     # Compact and simple ls (with /bin/ls to not trigger the other alias)

HISTFILE=~/.zsh_history # Where zsh saves command history (to enable persistent history)
HISTSIZE=100000         # Number of commands kept in memory during current session
SAVEHIST=100000         # Number of commands saved to disk

setopt HIST_SAVE_NO_DUPS   # Don't save duplicate commands to history
setopt INC_APPEND_HISTORY  # Append commands to history immediately (not just on exit)

bindkey "\e[A" history-beginning-search-backward  # Up arrow: search history by prefix
bindkey "\e[B" history-beginning-search-forward   # Down arrow: search history by prefix

# better than the zsh's built-in tab completion system
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Set up fzf key bindings and fuzzy completion
# Ctrl+R for fuzzy history search
# Ctrl+T for file search
source <(fzf --zsh)

# Set up zoxide to move between folders efficiently
eval "$(zoxide init zsh)"

# Set up the Starship prompt
# Shows git status, current branch, language versions, etc.
eval "$(starship init zsh)"
