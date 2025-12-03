{pkgs}:
pkgs.writeShellScriptBin "screenshootin.sh" ''
  grim -g "$(slurp)" - | swappy -f -
''
