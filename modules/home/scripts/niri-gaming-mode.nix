{pkgs}:
pkgs.writeShellScriptBin "niri-gaming-mode.sh" ''
  # Toggle Niri gaming mode - adds spacing between monitors to trap cursor on main display
  # Bind to Ctrl+Shift+G for quick gaming mode toggle

  STATE_FILE="''${XDG_RUNTIME_DIR:-/tmp}/niri-gaming-mode-state"

  # Normal positions (from your config)
  NORMAL_HDMI1_X=-1920
  NORMAL_HDMI1_Y=0
  NORMAL_DP2_X=2560
  NORMAL_DP2_Y=0

  # Gaming positions (adds large gaps to prevent cursor movement)
  GAMING_HDMI1_X=-10000  # Move left monitor far to the left
  GAMING_HDMI1_Y=0
  GAMING_DP2_X=10000    # Move right monitor far to the right
  GAMING_DP2_Y=0

  if [ -f "$STATE_FILE" ]; then
      # Gaming mode is ON, switch to NORMAL
      echo "Switching to NORMAL mode - monitors adjacent"
      niri msg output DP-2 position set -- $NORMAL_DP2_X $NORMAL_DP2_Y
      niri msg output HDMI-A-1 position set -- $NORMAL_HDMI1_X $NORMAL_HDMI1_Y
      rm "$STATE_FILE"
      ${pkgs.libnotify}/bin/notify-send "Gaming Mode OFF" "Monitors restored to normal positions" -i input-gaming
  else
      # Gaming mode is OFF, switch to GAMING
      echo "Switching to GAMING mode - cursor trapped on main monitor"
      niri msg output DP-2 position set -- $GAMING_DP2_X $GAMING_DP2_Y
      niri msg output HDMI-A-1 position set -- $GAMING_HDMI1_X $GAMING_HDMI1_Y
      touch "$STATE_FILE"
      ${pkgs.libnotify}/bin/notify-send "Gaming Mode ON" "Cursor confined to main monitor (DP-1)" -i input-gaming
  fi
''
