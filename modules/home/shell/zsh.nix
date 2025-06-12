{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 50000;
      save = 10000;
      path = "$HOME/.zhistory";
      ignoreDups = true;
      share = true;
    };
    initContent = ''
      # Set $PATH if ~/.local/bin exists
      if [ -d "$HOME/.local/bin" ]; then
      export PATH=$HOME/.local/bin:$PATH
      fi

      # Fuzzy find history
      autoload -U up-line-or-beginning-search
      autoload -U down-line-or-beginning-search
      zle -N up-line-or-beginning-search
      zle -N down-line-or-beginning-search
      bindkey "^[[A" up-line-or-beginning-search
      bindkey "^[[B" down-line-or-beginning-search

      # Shift-Tab to reverse menu completion
      bindkey '^[[Z' reverse-menu-complete

      # Control-Left and Control-Right for word navigation
      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word

      # Alt-Left and Alt-Right for word navigation
      bindkey "^[[1;3D" backward-word
      bindkey "^[[1;3C" forward-word

      ${pkgs.mcfly}/bin/mcfly init zsh | source /dev/stdin

      # Run fastfetch
      #${pkgs.fastfetchMinimal}/bin/fastfetch
    '';
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza -al --color=always --group-directories-first --icons";
      la = "${pkgs.eza}/bin/eza -a --color=always --group-directories-first --icons";
      ll = "${pkgs.eza}/bin/eza -l --color=always --group-directories-first --icons";
      lt = "${pkgs.eza}/bin/eza -aT --color=always --group-directories-first --icons";
      "l." = "${pkgs.eza}/bin/eza -ald --color=always --group-directories-first --icons .*";
      cat = "${pkgs.bat}/bin/bat --style header --style snip --style changes --style header";
      tarnow = "tar -acf";
      untar = "tar -zxvf";
      wget = "wget -c";
      psmem = "ps auxf | sort -nr -k 4";
      psmem10 = "ps auxf | sort -nr -k 4 | head -10";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      "......" = "cd ../../../../..";
      grep = "grep --color=auto";
      fgrep = "grep -F --color=auto";
      egrep = "grep -E --color=auto";
      ip = "ip -color";
      nixb = "sudo nixos-rebuild switch --flake /home/jordanl/.nixconf#desktop-3070S --upgrade";
      nixclean = "sudo nix-collect-garbage -d";
      jctl = "journalctl -p 3 -xb";
      dev = "cd ~/Extra/dev";
      devw = "cd ~/Extra/dev/web";
      nixup = "nix flake update --flake /home/jordanl/.nixconf";
      nixed = "cd ~/.nixconf && nvim";

      #git aliases
      ga = "git add";
      gaa = "git add --all";
      gapa = "git add --patch";
      gc = "git commit -v";
      gcr = "git commit -v --amend";
      gca = "git commit -v -a";
      gcar = "git commit -v -a --amend";
      gcam = "git commit -a -m";
      gcsm = "git commit -s -m";
      gcmsg = "git commit -m";
      gcs = "git commit -S";

      gco = "git checkout";
      gcd = "git checkout develop";
      gcm = "git checkout master";
      gcb = "git checkout -b";
      bgnm = "git branch --no-merged";
      gbr = "git branch --remote";
      ggsup = "git branch --set-upstream-to=origin/$(git branch --show-current)";

      glg = "git log --stat --max-count = 10";

      gcl = "git clone --recursive";
      gp = "git push";
      ggp = "git push origin $(current_branch)";
      gpsup = "git push --set-upstream origin $(git branch --show-current)";

      gf = "git fetch";
      gfa = "git fetch --all --prune";
      gfo = "git fetch origin";
      ggl = "git pull origin $(git branch --show-current)";
      ggpull = "git pull origin $(git branch --show-current)";
      ggpur = "git pull --rebase origin $(git branch --show-current)";
      glum = "git pull upstream master";
      gup = "git pull --rebase";
      ggpnp = "git pull origin $(git branch --show-current) && git push origin origin $(git branch --show-current)";
      gm = "git merge";
      gmom = "git merge origin/master";

      gr = "git remote";
      grv = "git remote -v";
      grmv = "git remote rename";
      grrm = "git remote remove";
      grset = "git remote set-url";
      grup = "git remote update";

      gs = "git status";
      gss = "git status -s";
      gsta = "git stash save";
      gstaa = "git stash apply";
      gstd = "git stash drop";
      gstl = "git stash list";
      grh = "git reset HEAD";
      grhh = "git reset HEAD --hard";
      gclean = "git clean -fd";
      gpristine = "git reset --hard && git clean -dfx";

      grbi = "git rebase -i";
      grba = "git rebase --abort";
      grbc = "git rebase --continue";
      grbs = "git rebase --skip";
      gcp = "git cherry-pick";
      gcpa = "git cherry-pick --abort";
      gcpc = "git cherry-pick --continue";

      gbl = "git blame";
      gbs = "git bisect";
      gbsb = "git bisect bad";
      gbsg = "git bisect good";
      gbsr = "git bisect reset";
      gbss = "git bisect start";
      gd = "git diff";
      gdca = "git diff --cached";
      gwch = "git whatchanged -p --abbrev-commit --pretty = medium";

      gg = "git gui citool";
      gga = "git gui citool --amend";
      gk = "gitk --all --branches";
    };
    plugins = [
      {
        name = "zsh-history-substring-search";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-history-substring-search";
          rev = "v1.0.2";
          sha256 = "0y8va5kc2ram38hbk2cibkk64ffrabfv1sh4xm7pjspsba9n5p1y";
        };
      }
    ];
  };
}
