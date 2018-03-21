#!/bin/sh
set -e

# https://www.miniclip.com/games/free-running-2/game-files/webgl/game.html
# https://www.miniclip.com/games/free-running-2/game-files/webgl/xmas/game.html

_get () {
  wget -nv -c "$1"
}

_gz () {
  (mv "$1" "${1}.gz" && gunzip "${1}.gz" 2>/dev/null) || mv "${1}.gz" "$1"
}

downloadFR2 () {
  top="$PWD"
  url="$2"
  cd "data/$1/webgl"
  rm -f WebGL.*
  _get "$url/Release/WebGL.data"
  _gz WebGL.data
  _get "$url/Release/WebGL.html.mem"
  _gz WebGL.html.mem
  _get "$url/Release/WebGL.js"
  mv WebGL.html.mem WebGL.mem
  sed -i 's|WebGL\.html\.mem|WebGL\.mem|g' WebGL.js
  cd "$top"
}

downloadFR2 "normal" "https://www.miniclip.com/games/free-running-2/game-files/webgl"
downloadFR2 "xmas" "https://www.miniclip.com/games/free-running-2/game-files/webgl/xmas"

#wget -nv -c "https://github.com/electron/electron-api-demos/releases/download/v1.3.0/electron-api-demos-linux.zip"

