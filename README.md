# macOS Development Setup

A minimal, distraction-free macOS development environment configuration.

## Applications to Install separately

- [**Homebrew**](https://brew.sh/) - Package manager for macOS
- [**Ghostty**](https://ghostty.org/download) - Modern terminal emulator (download Universal Binary)

## Quick Setup

```bash
brew install starship fzf zoxide zsh-autocomplete
brew install --cask zed

# only command that requires root and it is not present in the automatic script
sudo defaults write com.apple.universalaccess reduceMotion -bool true

# launch this script or execute the commands manually (see next section)
git clone https://github.com/delu999/my-macos-config
cd my-macos-config
chmod +x script.sh
./script.sh
```

## Credits

- Zsh setup inspired by: https://batsov.com/articles/2025/03/01/back-to-the-basics-zsh-without-oh-my-zsh/
- Animation and finder settings from: https://macos-defaults.com/
