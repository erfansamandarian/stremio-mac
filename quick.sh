#!/bin/bash

COLUMNS=$(tput cols)

print_message() {
    local message=$1
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
    printf "%*s\n" $(((${#message}+$COLUMNS)/2)) "$message"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
}

github_get="Getting project and script..."
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
extract_inst="Extracting and installing the application..."

print_message "$github_get"
# Get project and make install.sh executable
git clone https://github.com/erfansamandarian/stremio-mac && cd stremio-mac && chmod +x install.sh

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
npm install appdmg

print_message "$homebrew_lnk"
# Link Homebrew dependencies
brew unlink openssl && brew link --force openssl --force && brew unlink qt@5 && brew link --force qt@5

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

print_message "$extract_inst"
# Extract and copy the application from the dmg
hdiutil attach Stremio\ 4.4.168.dmg && cp -r /Volumes/Stremio\ 4.4.168/Stremio.app /Applications/ && hdiutil detach /Volumes/Stremio\ 4.4.168
