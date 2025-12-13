{pkgs, ...}: {
  programs.nixvim = {
    config = {
      enable = true;
      defaultEditor = true;
      withPython3 = true;

      colorschemes = {
        # everforest = {
        #   enable = true;
        #   settings = {
        #     background = "hard";
        #   };
        # };
        # base16 = {
        #   enable = true;
        #   colorscheme = "dracula";
        # };
        ayu = {
          enable = true;
          settings.mirage = true;
        };
      };

      globals = {
        #set <space> as the leader key
        mapleader = " ";
        maplocalleader = " ";

        have_nerd_font = true;
      };
      opts = {
        number = true;
        relativenumber = true;
        mouse = "a";
        showmode = false;
        tabstop = 4;
        shiftwidth = 4;
        breakindent = true;

        clipboard = {
          providers = {
            wl-copy.enable = true;
            # xsel.enable = true;
          };
          register = "unnamedplus";
        };

        undofile = true;

        ignorecase = true;
        smartcase = true;

        signcolumn = "yes";
        updatetime = 250;
        timeoutlen = 300;
        list = true;

        # NOTE: .__raw here means that this field is raw lua code
        listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

        # Preview subsitutions live, as you type!
        inccommand = "split";

        # Show which line your cursor is on
        cursorline = true;

        # Minimal number of screen lines to keep above and below the cursor
        scrolloff = 10;

        confirm = true;

        # See `:help hlsearch`
        hlsearch = true;
      };

      autoGroups = {
        kickstart-highlight-yank = {
          clear = true;
        };
      };

      autoCmd = [
        # Highlight when yanking (copying) text
        #  Try it with `yap` in normal mode
        #  See `:help vim.highlight.on_yank()`
        {
          event = ["TextYankPost"];
          desc = "Highlight when yanking (copying) text";
          group = "kickstart-highlight-yank";
          callback.__raw = ''
            function()
              vim.highlight.on_yank()
            end
          '';
        }
      ];
      plugins = {
        # Adds icons for plugins to utilize in ui
        # web-devicons.enable = true;

        # Detect tabstop and shiftwidth automatically
        # https://nix-community.github.io/nixvim/plugins/sleuth/index.html
        # sleuth = {
        #   enable = true;
        # };

        # Highlight todo, notes, etc in comments
        # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
        todo-comments = {
          settings = {
            enable = true;
            signs = true;
          };
        };
        luasnip = {
          enable = true;
        };

        direnv = {
          enable = true;
        };
      };
      extraPython3Packages = ps: with ps; [pynvim tasklib six packaging];
      extraPlugins = with pkgs; [
        vimPlugins.taskwiki
        vimPlugins.vim-zettel
      ];
      extraConfigLua = ''
        vim.cmd [[
          highlight Normal guibg=none
          highlight NonText guibg=none
          highlight Normal ctermbg=none
          highlight NonText ctermbg=none
        ]]

      '';
      extraConfigVim = ''
        au BufNewFile ~/notes/diary/*.md :silent 0r !~/.nvim/bin/generate-vimwiki-diary-template.lua '%'

        function! s:insert_id()
          if exists("g:zettel_current_id")
            return g:zettel_current_id
          else
            return "unnamed"
          endif
        endfunction

        let g:taskwiki_dont_fold = 'yes'
        let g:taskwiki_dont_preserve_folds = 'yes'
        let g:vimwiki_markdown_link_ext = 1

        let g:zettel_options = [{"template" : "~/notes/meta/zettel.tpl", "rel_path" : "zettel/", "disable_front_matter" : 1}]
        let g:zettel_format = "%y%m%d%H%M"

        nnoremap <leader>zn :ZettelNew<space>
      '';
    };
  };
}
