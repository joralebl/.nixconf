{config, ...}: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    #noctalia

    "Mod+D".action = spawn ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
    "Mod+S".action = spawn ["noctalia-shell" "ipc" "call" "controlCenter" "toggle"];
    "Mod+Shift+S".action = spawn ["noctalia-shell" "ipc" "call" "settings" "toggle"];
    "Mod+Alt+B".action = spawn ["noctalia-shell" "ipc" "call" "bar" "toggle"];
    "Mod+Alt+L".action = spawn ["noctalia-shell" "ipc" "call" "lockScreen" "lock"];
    "Mod+Shift+Q".action = spawn ["noctalia-shell" "ipc" "call" "sessionMenu" "toggle"];
    "Ctrl+Alt+Delete".action = spawn ["noctalia-shell" "ipc" "call" "sessionMenu" "toggle"];

    #niri
    "Mod+Shift+Slash".action = show-hotkey-overlay;
    "Mod+Return".action = spawn "kitty";
    "Mod+Q".action = close-window;
    "Mod+E".action = spawn "thunar";
    "Mod+O".action = toggle-overview;

    "Mod+H".action = focus-column-left;
    "Mod+J".action = focus-window-down;
    "Mod+K".action = focus-window-up;
    "Mod+L".action = focus-column-right;

    "Mod+Ctrl+H".action = move-column-left;
    "Mod+Ctrl+J".action = move-window-down;
    "Mod+Ctrl+K".action = move-window-up;
    "Mod+Ctrl+L".action = move-column-right;

    "Mod+Home".action = focus-column-first;
    "Mod+End".action = focus-column-last;
    "Mod+Ctrl+Home".action = move-column-to-first;
    "Mod+Ctrl+End".action = move-column-to-last;

    "Mod+Shift+H".action = focus-monitor-left;
    "Mod+Shift+J".action = focus-monitor-down;
    "Mod+Shift+K".action = focus-monitor-up;
    "Mod+Shift+L".action = focus-monitor-right;

    "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+J".action = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+K".action = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+L".action = move-column-to-monitor-left;

    # "Mod+Alt+K".action = focus-workspace-up;
    # "Mod+Alt+J".action = focus-workspace-down;
    # "Mod+Ctrl+Alt+K".action = move-column-to-workspace-up;
    # "Mod+Ctrl+Alt+J".action = move-column-to-workspace-down;
    "Mod+U".action = focus-workspace-up;
    "Mod+I".action = focus-workspace-down;
    "Mod+Ctrl+U".action = move-column-to-workspace-up;
    "Mod+Ctrl+I".action = move-column-to-workspace-down;
    "Mod+Shift+U".action = move-workspace-down;
    "Mod+Shift+I".action = move-workspace-up;

    "Mod+BracketLeft".action = consume-or-expel-window-left;
    "Mod+BracketRight".action = consume-or-expel-window-right;
    "Mod+Comma".action = consume-window-into-column;
    "Mod+Period".action = expel-window-from-column;

    "Mod+V".action = toggle-window-floating;
    "Mod+Shift+v".action = switch-focus-between-floating-and-tiling;
    "Mod+W".action = toggle-column-tabbed-display;

    "Mod+R".action = switch-preset-column-width;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;
    "Mod+Ctrl+F".action = expand-column-to-available-width;
    "Mod+C".action = center-column;
    "Mod+Ctrl+C".action = center-visible-columns;
    "Mod+Equal".action = set-column-width "+10%";
    "Mod+Minus".action = set-column-width "-10%";

    "Mod+WheelScrollUp".action = focus-column-right;
    "Mod+WheelScrollDown".action = focus-column-left;
    "Mod+Ctrl+WheelScrollUp".action = move-column-right;
    "Mod+Ctrl+WheelScrollDown".action = move-column-left;

    "Mod+Shift+WheelScrollDown".action = focus-workspace-down;
    "Mod+Shift+WheelScrollUp".action = focus-workspace-up;
    "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-to-workspace-down;
    "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-to-workspace-up;

    #~~~custom scripts
    "Mod+Alt+G" = {
      action = spawn ["niri-gaming-mode.sh"];
    };
    "Mod+Alt+C".action = spawn ["screenshootin.sh"];
  };
}
