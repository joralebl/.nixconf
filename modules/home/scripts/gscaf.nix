{pkgs}:
pkgs.writeShellScriptBin "gscaf" ''

  #! /usr/bin/env bash
  set -euo pipefail


  cdir=''${PWD##*/}
  cdir=''${cdir:-/}


  git init --initial-branch main
  git remote add origin ssh://git@github.com/joralebl/$cdir.git
  git remote set-url --add origin ssh://git@codeberg.org/joralebl/$cdir.git

''
