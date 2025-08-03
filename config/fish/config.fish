/opt/homebrew/bin/brew shellenv | source

set fish_greeting "" 

set -x PATH /Applications/kitty.app/Contents/MacOS $PATH

alias f "fd . --type f | fzf --style full --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}' --print0 | xargs -0 -o nvim"

alias ls "eza --icons"

function postexec_newline --on-event fish_postexec
   echo
end

bind super-e forward-char
