{...}: {
  programs.nixvim = {
    config = {
      enable = true;
      defaultEditor = true;

      colorschemes = {
        everforest = {
          enable = true;
          settings = {
            background = "hard";
          };
        };
      };

      extraConfigLua = ''
        vim.cmd [[
        highlight Normal guibg=none
        highlight NonText guibg=none
        highlight Normal ctermbg=none
        highlight NonText ctermbg=none
        ]]
      '';

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
            xsel.enable = true;
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
      keymaps = [
        {
          mode = [
            "n"
            "x"
          ];
          key = "j";
          action = "v:count == 0 ? 'gj' : 'j'";
          options = {
            expr = true;
            silent = true;
          };
        }
        {
          mode = [
            "n"
            "x"
          ];
          key = "<Down>";
          action = "v:count == 0 ? 'gj' : 'j'";
          options = {
            expr = true;
            silent = true;
          };
        }
        {
          mode = [
            "n"
            "x"
          ];
          key = "k";
          action = "v:count == 0 ? 'gk' : 'k'";
          options = {
            expr = true;
            silent = true;
          };
        }
        {
          mode = [
            "n"
            "x"
          ];
          key = "<Up>";
          action = "v:count == 0 ? 'gk' : 'k'";
          options = {
            expr = true;
            silent = true;
          };
        }
        {
          mode = "n";
          key = "<C-h>";
          action = "<C-w>h";
          options = {
            desc = "Go to Left Window";
            remap = true;
          };
        }
        {
          mode = "n";
          key = "<C-j>";
          action = "<C-w>j";
          options = {
            desc = "Go to Lower Window";
            remap = true;
          };
        }
        {
          mode = "n";
          key = "<C-k>";
          action = "<C-w>k";
          options = {
            desc = "Go to Upper Window";
            remap = true;
          };
        }
        {
          mode = "n";
          key = "<C-l>";
          action = "<C-w>l";
          options = {
            desc = "Go to Right Window";
            remap = true;
          };
        }
        {
          mode = "n";
          key = "<C-Up>";
          action = "<cmd>resize +2<cr>";
          options = {
            desc = "Increase Window Height";
          };
        }
        {
          mode = "n";
          key = "<C-Down>";
          action = "<cmd>resize -2<cr>";
          options = {
            desc = "Decrease Window Height";
          };
        }
        {
          mode = "n";
          key = "<C-Left>";
          action = "<cmd>vertical resize -2<cr>";
          options = {
            desc = "Decrease Window Width";
          };
        }
        {
          mode = "n";
          key = "<C-Right>";
          action = "<cmd>vertical resize +2<cr>";
          options = {
            desc = "Increase Window Width";
          };
        }
        {
          mode = "n";
          key = "<A-j>";
          action = "<cmd>m .+1<cr>==";
          options = {
            desc = "Move Down";
          };
        }
        {
          mode = "n";
          key = "<A-k>";
          action = "<cmd>m .-2<cr>==";
          options = {
            desc = "Move Up";
          };
        }
        {
          mode = "i";
          key = "<A-j>";
          action = "<esc><cmd>m .+1<cr>==gi";
          options = {
            desc = "Move Down";
          };
        }
        {
          mode = "i";
          key = "<A-k>";
          action = "<esc><cmd>m .-2<cr>==gi";
          options = {
            desc = "Move Up";
          };
        }
        {
          mode = "v";
          key = "<A-j>";
          action = ":m '>+1<cr>gv=gv";
          options = {
            desc = "Move Down";
          };
        }
        {
          mode = "v";
          key = "<A-k>";
          action = ":m '<-2<cr>gv=gv";
          options = {
            desc = "Move Up";
          };
        }
        {
          mode = "i";
          key = ";";
          action = ";<c-g>u";
        }
        {
          mode = "i";
          key = ".";
          action = ".<c-g>u";
        }
        {
          mode = "i";
          key = ";";
          action = ";<c-g>u";
        }
        {
          mode = [
            "i"
            "x"
            "n"
            "s"
          ];
          key = "<C-s>";
          action = "<cmd>w<cr><esc>";
          options = {
            desc = "Save File";
          };
        }
        {
          mode = [
            "i"
            "n"
          ];
          key = "<esc>";
          action = "<cmd>noh<cr><esc>";
          options = {
            desc = "Escape and Clear hlsearch";
          };
        }
        {
          mode = "n";
          key = "<leader>ur";
          action = "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>";
          options = {
            desc = "Redraw / Clear hlsearch / Diff Update";
          };
        }
        {
          mode = "n";
          key = "n";
          action = "'Nn'[v:searchforward].'zv'";
          options = {
            expr = true;
            desc = "Next Search Result";
          };
        }
        {
          mode = "x";
          key = "n";
          action = "'Nn'[v:searchforward]";
          options = {
            expr = true;
            desc = "Next Search Result";
          };
        }
        {
          mode = "o";
          key = "n";
          action = "'Nn'[v:searchforward]";
          options = {
            expr = true;
            desc = "Next Search Result";
          };
        }
        {
          mode = "n";
          key = "N";
          action = "'nN'[v:searchforward].'zv'";
          options = {
            expr = true;
            desc = "Prev Search Result";
          };
        }
        {
          mode = "x";
          key = "N";
          action = "'nN'[v:searchforward]";
          options = {
            expr = true;
            desc = "Prev Search Result";
          };
        }
        {
          mode = "o";
          key = "N";
          action = "'nN'[v:searchforward]";
          options = {
            expr = true;
            desc = "Prev Search Result";
          };
        }
        {
          mode = "n";
          key = "<leader>cd";
          action = "vim.diagnostic.open_float";
          options = {
            desc = "Line Diagnostics";
          };
        }
        {
          mode = "n";
          key = "]d";
          action = "diagnostic_goto(true)";
          options = {
            desc = "Next Diagnostic";
          };
        }
        {
          mode = "n";
          key = "[d";
          action = "diagnostic_goto(false)";
          options = {
            desc = "Prev Diagnostic";
          };
        }
        {
          mode = "n";
          key = "]e";
          action = "diagnostic_goto(true 'ERROR')";
          options = {
            desc = "Next Error";
          };
        }
        {
          mode = "n";
          key = "[e";
          action = "diagnostic_goto(false 'ERROR')";
          options = {
            desc = "Prev Error";
          };
        }
        {
          mode = "n";
          key = "]w";
          action = "diagnostic_goto(true 'WARN')";
          options = {
            desc = "Next Warning";
          };
        }
        {
          mode = "n";
          key = "[w";
          action = "diagnostic_goto(false 'WARN')";
          options = {
            desc = "Prev Warning";
          };
        }
        {
          mode = "n";
          key = "<leader>qq";
          action = "<cmd>qa<cr>";
          options = {
            desc = "Quit All";
          };
        }
        {
          mode = "n";
          key = "<leader>ui";
          action = "vim.show_pos";
          options = {
            desc = "Inspect Pos";
          };
        }
        {
          mode = "t";
          key = "<esc><esc>";
          action = "<c-\\><c-n>";
          options = {
            desc = "Enter Normal Mode";
          };
        }
        {
          mode = "t";
          key = "<C-h>";
          action = "<cmd>wincmd h<cr>";
          options = {
            desc = "Go to Left Window";
          };
        }
        {
          mode = "t";
          key = "<C-j>";
          action = "<cmd>wincmd j<cr>";
          options = {
            desc = "Go to Lower Window";
          };
        }
        {
          mode = "t";
          key = "<C-k>";
          action = "<cmd>wincmd k<cr>";
          options = {
            desc = "Go to Upper Window";
          };
        }
        {
          mode = "t";
          key = "<C-l>";
          action = "<cmd>wincmd l<cr>";
          options = {
            desc = "Go to Right Window";
          };
        }
        {
          mode = "t";
          key = "<C-/>";
          action = "<cmd>close<cr>";
          options = {
            desc = "Hide Terminal";
          };
        }
        {
          mode = "n";
          key = "<leader>ww";
          action = "<C-W>p";
          options = {
            desc = "Other Window";
            remap = true;
          };
        }
        {
          mode = "n";
          key = "<leader>wd";
          action = "<C-W>c";
          options = {
            desc = "Delete Window";
            remap = true;
          };
        }
        {
          mode = "n";
          key = "<leader>w-";
          action = "<C-W>s";
          options = {
            desc = "Split Window Below";
            remap = true;
          };
        }
        {
          mode = "n";
          key = "<leader>w|";
          action = "<C-W>v";
          options = {
            desc = "Split Window Right";
            remap = true;
          };
        }
        {
          mode = "n";
          key = "<leader>-";
          action = "<C-W>s";
          options = {
            desc = "Split Window Below";
            remap = true;
          };
        }
        {
          mode = "n";
          key = "<leader>|";
          action = "<C-W>v";
          options = {
            desc = "Split Window Right";
            remap = true;
          };
        }
        {
          mode = "n";
          key = "<leader><tab>l";
          action = "<cmd>tablast<cr>";
          options = {
            desc = "Last Tab";
          };
        }
        {
          mode = "n";
          key = "<leader><tab>f";
          action = "<cmd>tabfirst<cr>";
          options = {
            desc = "First Tab";
          };
        }
        {
          mode = "n";
          key = "<leader><tab><tab>";
          action = "<cmd>tabnew<cr>";
          options = {
            desc = "New Tab";
          };
        }
        {
          mode = "n";
          key = "<leader><tab>]";
          action = "<cmd>tabnext<cr>";
          options = {
            desc = "Next Tab";
          };
        }
        {
          mode = "n";
          key = "<leader><tab>d";
          action = "<cmd>tabclose<cr>";
          options = {
            desc = "Close Tab";
          };
        }
        {
          mode = "n";
          key = "<leader><tab>[";
          action = "<cmd>tabprevious<cr>";
          options = {
            desc = "Previous Tab";
          };
        }
      ];

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
        web-devicons.enable = true;

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
    };
  };
}
