# Stremio for Apple Silicon 

<div align="center">

![logo](docs/image.png)

</div>

## Installation with DMG

Download DMG: https://github.com/erfansamandarian/stremio-mac/releases/download/v4.4.168/Stremio.4.4.168.dmg

Install dependencies: `brew install mpv node qt@5 ffmpeg openssl@3`

Run: `sudo xattr -r -d com.apple.quarantine /Applications/Stremio.app`

## Installation with Script

### Quicker

`bash -c "$(wget -qLO - https://github.com/erfansamandarian/stremio-mac/raw/master/quick.sh)"`

(Note: you will have to provide sudo access for finalize.sh and pack.sh)

### Quick

1. `git clone https://github.com/erfansamandarian/stremio-mac`

2. `cd stremio-mac`

3. `chmod +x install.sh`

4. `./install.sh` (Note: you will have to provide sudo access for finalize.sh and pack.sh)

5. Open the .dmg file and drag and drop the Stremio application into your Applications folder

<div align="center">

![install](docs/install.png)

</div>
