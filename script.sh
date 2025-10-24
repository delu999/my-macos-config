#!/bin/bash

# macOS Development Environment Configuration Script
# Configures keyboard, UI, dock, animations, and Finder for a minimal setup

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "- Setting fastest key repeat rate and minimal initial key repeat delay..."
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15


echo "- Hiding menu bar..."
defaults write -g _HIHideMenuBar -bool true
defaults write -g AppleMenuBarVisibleInFullscreen -bool false

echo "- Configuring dock (auto-hide, minimal size, remove animations)..."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 16
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock springboard-show-duration -float 0.1
defaults write com.apple.dock springboard-hide-duration -float 0.1
killall Dock

echo "- Disabling system animations..."
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

echo "- Configuring Finder settings..."
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults delete com.apple.finder FXInfoPanesExpanded 2>/dev/null || true
defaults delete com.apple.finder FXDesktopVolumePositions 2>/dev/null || true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarShowingiCloudDesktop -bool false
defaults write com.apple.finder FK_StandardViewSettings -dict-add ListViewSettings '{ "columns" = ( { "ascending" = 1; "identifier" = "name"; "visible" = 1; "width" = 300; }, { "ascending" = 0; "identifier" = "dateModified"; "visible" = 1; "width" = 181; }, { "ascending" = 0; "identifier" = "size"; "visible" = 1; "width" = 97; } ); "iconSize" = 16; "showIconPreview" = 0; "sortColumn" = "name"; "textSize" = 12; "useRelativeDates" = 1; }'
killall Finder

# ============================================
# WALLPAPER SETTINGS
# ============================================
if [ -f "$SCRIPT_DIR/wallpaper.jpg" ]; then
    echo "- Setting desktop wallpaper..."
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$SCRIPT_DIR/wallpaper.jpg\""
fi

# ============================================
# CONFIGURATION FILES
# ============================================
echo "- Setting configuration files for zsh and ghostty ..."

if [ -f "$SCRIPT_DIR/.zshrc" ]; then
    cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
fi

if [ -f "$SCRIPT_DIR/ghostty-config" ]; then
    mkdir -p "$HOME/.config/ghostty"
    cp "$SCRIPT_DIR/ghostty-config" "$HOME/.config/ghostty/config"
fi
echo ""

echo "Configuration Complete!"
echo "IMPORTANT: Logout or restart your Mac for all changes to take effect."
echo ""
