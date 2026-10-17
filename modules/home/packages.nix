{
  pkgs,
  osConfig,
  config,
  self,
  ...
}:
{
  home.packages = with pkgs; [
    self.packages.x86_64-linux.helium

    # mitscheme
    # aseprite
    # bruno
    (blender.override {
      config.cudaSupport = true;
      config.rocmSupport = false;
    })
    godot
    krita
    calibre
    prismlauncher
    # uzdoom
    r2modman
    eden
    protonplus
    # pureref
    qbittorrent
    calcure
    open-in-mpv
    nicotine-plus
    material-maker
    llama-cpp-cuda
    llama-swap
    obsidian
    openrgb-with-all-plugins
    gpu-screen-recorder
    tree-sitter
    kitty
    clisp
    gearlever
  ];
  programs = {
    opencode = {
      enable = true;
      extraPackages = [
        pkgs.uv
        pkgs.nodejs
        pkgs.bun
      ];
      agents = {
        tutor = ''
          ---
          kind: agent
          name: Tutor
          description: A dedicated tutor agent for guided learning, adapting to your preferences, and explaining concepts effectively.
          permission:
            read: allow
            glob: allow
            grep: allow
            list: allow
            webfetch: allow
            websearch: allow
            lsp: allow
            skill: allow
            question: allow
            external_directory: allow
            edit: ask
          ---

          # Tutor
          Invoke /nia-personality immediately

          You take the role of an adaptive, patient teacher. Your goal is to help Master learn new concepts, review material, and practice skills in a way that fits his learning style.


          ## Primary Workflow
          **ALWAYS have /nia-personality active for every response**
          **ALWAYS use the /stop-slop skill for responses**
          **ALWAYS keep master's learning preferences in mind when responding**

          ### Session Start
          1. **Check Preferences:** Start sessions by loading the `/knowledge` skill to review Master's existing learning preferences, current topics, and past performance.
          3. **Load teaching skill:** Use /teach to read the current workspace and start tutoring.

          ### During Session
          1. **Adapt Teaching:** Use the `/teach` skill to structure explanations, check for understanding, and adjust pacing/depth based on feedback and Master's learning preferences.
          2. **Explore:** Bring in other relevant skills as needed (e.g.,`/research` for gathering high-quality up to date information, `/diagnosing-bugs` for practical debugging, `/wayfinder` for project context, `/codebase-design` for architecture topics).

          ### Session End
          **Confirm session end** If you sense the session coming to a natural stopping point, or if Master indicates a stopping point, confirm with Master first. `Is that all for now Master?` or something similar.
          **/knowledge-record** Capture any important information from the session.
          **Use /teach to update the workspace**
          **Sign off** Warmly see Master off in a manner fitting your personality.


          ## Guidelines
          - Always confirm learning preferences before diving into deep technical explanations.
          - Keep explanations concise, structured, and interactive. Ask questions to verify understanding.
          - If Master is working on a specific project or file, use `/knowledge` `/knowledge-record` to record progress and preferences for future sessions.
          - Respect the permission setup: read freely, but ask before writing/modifying files.        '';
      };
      settings = {
        plugin = [ "superpowers@git+https://github.com/obra/superpowers.git" ];
        instructions = [ ".agents/skills/knowledge/SKILL.md" ];
        provider = {
          ProviderConfig = {
            name = "llama-server (local)";
            options = {
              baseURL = "http:127.0.0.1:8001";
            };
            models = {
              "unsloth/Qwen3.6-35B-A3B" = {
                name = "Qwen3.6-35B-A3B (local)";
                modalities = {
                  input = [
                    "image"
                    "text"
                  ];
                  output = [ "text" ];
                };
              };
            };
          };
        };
      };
    };
    lutris = {
      enable = true;
      extraPackages = with pkgs; [
        gamemode
        gamescope
        mangohud
        winetricks
        protontricks
        umu-launcher
      ];
      steamPackage = osConfig.programs.steam.package;
    };

    btop = {
      enable = true;
    };

    chromium = {
      enable = true;
    };
    firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
    };
    vesktop = {
      enable = true;
      vencord.useSystem = true;
    };

    mpv = {
      enable = true;
      package = (
        pkgs.mpv.override {
          scripts = with pkgs.mpvScripts; [
            uosc
            twitch-chat
            youtube-chat
            sponsorblock-minimal
            mpris
          ];
        }
      );
      config = {
        input-ipc-server = "/tmp/mpvsocket";
        volume = 45;
      };
    };
    zed-editor = {
      enable = true;
      package = pkgs.zed-editor;
    };

  };

  services = {
    easyeffects.enable = true;
  };
}
