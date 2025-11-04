alias zed="open -a /Applications/Zed.app"                   # Open a file/directory with: zed [file_name]
alias code="open -a '/Applications/Visual Studio Code.app'" # Open a file/directory with: zed [file_name]
alias c='z'                                                 # Replaces cd with zoxide
alias ci='zi'                                               # interactive zoxide
alias l='ls -lahG'

HISTFILE=~/.zsh_history # location of the history file
HISTFILESIZE=100000 # history limit of the file on disk
HISTSIZE=200000 # current session's history limit
SAVEHIST=500000 # zsh saves this many lines from the in-memory history list to the history file upon shell exit

setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don\'t record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don\'t record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don\'t write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.


bindkey "\e[A" history-beginning-search-backward  # Up arrow: search history by prefix
bindkey "\e[B" history-beginning-search-forward   # Down arrow: search history by prefix

# better than the zsh's built-in tab completion system
autoload -U compinit; compinit

# Set up fzf key bindings and fuzzy completion
# Ctrl+R for fuzzy history search
# Ctrl+T for file search
source <(fzf --zsh)

# Set up zoxide to move between folders efficiently
eval "$(zoxide init zsh)"

# Set up the Starship prompt
# Shows git status, current branch, language versions, etc.
eval "$(starship init zsh)"
