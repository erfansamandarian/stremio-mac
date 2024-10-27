#!/bin/bash

set -e

TAG=${1:-master}

DEST_DIR=./stremio.app/Contents/MacOS

cp $(which ffmpeg) $DEST_DIR/
cp $(which ffprobe) $DEST_DIR/
cp $(which node) $DEST_DIR/
chmod +w $DEST_DIR/ffmpeg
chmod +w $DEST_DIR/ffprobe
chmod +w $DEST_DIR/node

mkdir -p ./stremio.app/Contents/Frameworks

SHELL_VERSION=$(git grep -hoP '^\s*VERSION\s*=\s*\K.*$' HEAD -- stremio.pro)
curl $(cat ./server-url.txt) > $DEST_DIR/server.js
# ./mac/fix_osx_deps.sh "./stremio.app/Contents/Frameworks" "@executable_path/../Frameworks"
