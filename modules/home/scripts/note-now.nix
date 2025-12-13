{pkgs}:
pkgs.writeShellScriptBin "note-now.sh" ''

  #! /usr/bin/env bash
  set -euo pipefail

  now='false'

  while getopts 'n' flag; do
  	case "''${flag}" in
  	  n) now='true' ;;
  	  *) exit 1 ;;
    esac
  done

  if [ $now = 'true' ]; then
  	ts="$(date +%Y%m%d%H%M%S)"
  else
  	ts="$(date +%y%m%d%H%M)"
  fi

  file="''${ts}.md"

  if [ ! -f $file ]; then
    touch -- "$file"
  fi

  : "''${EDITOR:=vi}"
  "$EDITOR" "$file"

''
