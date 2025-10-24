# macOS Development Setup

A minimal, distraction-free macOS development environment configuration.

## Applications to Install

- [**Homebrew**](https://brew.sh/) - Package manager for macOS
- [**Ghostty**](https://ghostty.org/download) - Modern terminal emulator (download Universal Binary)
- [**Zed**](https://zed.dev/download) - High-performance code editor
- [**Raycast**](https://www.raycast.com/) - Productivity tool with clipboard history, app launchers and window management

## Quick Setup

```bash
brew install starship fzf zoxide

git clone https://github.com/delu999/my-macos-config
cd my-macos-config
chmod +x script.sh
./script.sh

sudo defaults write com.apple.universalaccess reduceMotion -bool true
# this last command requieres root and it is not present in the script

```

---

## Manual Configuration

If you prefer to run commands individually, you can execute any of the sections below.

### Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install CLI Tools

```bash
brew install starship fzf zoxide
```

### Copy Configuration Files

```bash
# Install zsh configuration
cp .zshrc $HOME/.zshrc

# Install Ghostty configuration
mkdir -p $HOME/.config/ghostty
cp ghostty-config $HOME/.config/ghostty/config

# Set desktop wallpaper (creates cohesive look with hidden menubar)
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$PWD/wallpaper.jpg\""
```

### Keyboard Settings

Fast key repeat for improved typing experience. Requires logout/restart.

```bash
# Set fastest key repeat rate
defaults write -g KeyRepeat -int 1

# Set minimal initial key repeat delay
defaults write -g InitialKeyRepeat -int 15
```

### UI Settings (Menubar & Dock)

Hide menubar and configure dock for minimal distraction.

```bash
# Hide menu bar
defaults write -g _HIHideMenuBar -bool true
defaults write -g AppleMenuBarVisibleInFullscreen -bool false

# Configure dock (auto-hide, minimal size)
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 16
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock springboard-show-duration -float 0.1
defaults write com.apple.dock springboard-hide-duration -float 0.1

# Restart Dock
killall Dock
```

### Animation Settings

Disable system animations for faster UI response.

```bash
sudo defaults write com.apple.universalaccess reduceMotion -bool true
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Restart Dock to apply changes
killall Dock
```

### Finder Settings

Optimize Finder for better usability and list view.

```bash
# Set list view as default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Clean up old settings
defaults delete com.apple.finder FXInfoPanesExpanded 2>/dev/null || true
defaults delete com.apple.finder FXDesktopVolumePositions 2>/dev/null || true

# Configure search to use current folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show status bar and path bar
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Configure sidebar
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarShowingiCloudDesktop -bool false

# Configure list view columns and sorting
defaults write com.apple.finder FK_StandardViewSettings -dict-add ListViewSettings '{ "columns" = ( { "ascending" = 1; "identifier" = "name"; "visible" = 1; "width" = 300; }, { "ascending" = 0; "identifier" = "dateModified"; "visible" = 1; "width" = 181; }, { "ascending" = 0; "identifier" = "size"; "visible" = 1; "width" = 97; } ); "iconSize" = 16; "showIconPreview" = 0; "sortColumn" = "name"; "textSize" = 12; "useRelativeDates" = 1; }'

# Restart Finder
killall Finder
```

## Post-Installation
Logout or restart your Mac to apply all settings

## Credits

- Zsh setup inspired by: https://batsov.com/articles/2025/03/01/back-to-the-basics-zsh-without-oh-my-zsh/
- Animation and finder settings from: https://github.com/ChrisTitusTech/macutil
