# Update

icu4c@75 has been disabled in brew, you could still install it by tapping into homebrew core but ain't nobody got time for that

i'll update to fix this when i have time :)

# Stremio for Apple Silicon 

<div align="center">

![logo](docs/image.png)

</div>

## Installation with Script

### Quickest

```sh
bash -c "$(wget -qLO - https://github.com/erfansamandarian/stremio-mac/raw/master/quick.sh)"
```

(Note: you will have to provide sudo access for finalize.sh and pack.sh)

### Quickish (but make your own DMG)

```sh
git clone https://github.com/erfansamandarian/stremio-mac
```

```sh
cd stremio-mac
```

```sh
chmod +x install.sh
```

```sh
./install.sh
```

(Note: you will have to provide sudo access for finalize.sh and pack.sh)

`Open the .dmg file and drag and drop the Stremio application into your Applications folder`

<div align="center">

![install](docs/install.png)

</div>

## Installation with DMG

Download DMG:
https://github.com/erfansamandarian/stremio-mac/releases/download/v4.4.169/Stremio.4.4.169.dmg

Install dependencies:
```sh
brew install mpv node qt@5 ffmpeg openssl@3 icu4c@75
```

Run: 
```sh
sudo xattr -r -d com.apple.quarantine /Applications/Stremio.app
```
