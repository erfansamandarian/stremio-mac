#!/bin/bash

COLUMNS=$(tput cols)

print_message() {
    local message=$1
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
    printf "%*s\n" $(((${#message}+$COLUMNS)/2)) "$message"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
}

github_upd="Updating GitHub submodules..."
homebrew_upd="Updating Homebrew dependencies..."
homebrew_dep="Installing Homebrew dependencies..."
homebrew_cas="Installing Homebrew cask dependencies..."
install_appd="Installing appdmg..."
homebrew_lnk="Linking Homebrew dependencies..."
running_qmak="Running qmake..."
running_cmak="Running cmake..."
building_cmk="Building with cmake..."
running_finl="Running finalize.sh..."
running_pack="Running pack.sh..."

print_message "$github_upd"
# Update GitHub submodules 
git submodule update --init --recursive

print_message "$homebrew_upd"
# Update Homebrew dependencies
brew update && brew upgrade && brew autoremove && brew cleanup

print_message "$homebrew_dep"
# Install Homebrew dependencies
brew install openssl mpv ffmpeg node cmake qt@5 node npm

print_message "$homebrew_cas"
# Install Homebrew cask dependencies
brew install --cask qt-creator

print_message "$install_appd"
# Ensure appdmg is installed
npm install -g appdmg

print_message "$homebrew_lnk"
# Link Homebrew dependencies
brew link openssl --force && brew link qt5 --force

print_message "$running_qmak"
# Run qmake
qmake CONFIG+=sdk_no_version_check

print_message "$running_cmak"
# Run cmake
cmake -DCMAKE_PREFIX_PATH=/opt/homebrew/opt/qt@5 .

print_message "$building_cmk"
# Build with cmake
cmake --build .

print_message "$running_finl"
# Run ./mac/finalize.sh
chmod +x ./mac/finalize.sh && sudo ./mac/finalize.sh

print_message "$running_pack"
# Run ./mac/pack.sh
chmod +x ./mac/pack.sh && sudo ./mac/pack.sh
