{
  pkgs,
  lib,
  ...
}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      stylua
      isort
      black
      shellcheck
      shellharden
      shfmt
    ];

    plugins.conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = false;
        notify_no_formatters = true;
        formatters_by_ft = {
          bash = ["shellcheck" "shellharden" "shfmt"];
          lua = ["stylua"];
          nix = ["alejandra"];
          python = ["isort" "black"];
          javascript = {
            __unkeyed-1 = "prettierd";
            __unnkeyed-2 = "prettier";
            stop_after_first = true;
          };
          javascriptreact = {
            __unkeyed-1 = "prettierd";
            __unnkeyed-2 = "prettier";
            stop_after_first = true;
          };
          typescript = {
            __unkeyed-1 = "prettierd";
            __unnkeyed-2 = "prettier";
            stop_after_first = true;
          };
          typescriptreact = {
            __unkeyed-1 = "prettierd";
            __unnkeyed-2 = "prettier";
            stop_after_first = true;
          };
          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
          # Conform can also run multiple formatters sequentially
          # python = [ "isort "black" ];
          # to use only the first one it finds in the list, set stop_after_first to true
        };
      };
      format_on_save = ''
        function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end

          if slow_format_filetypes[vim.bo[bufnr].filetype] then
            return
          end

          local function on_format(err)
            if err and err:match("timeout$") then
              slow_format_filetypes[vim.bo[bufnr].filetype] = true
            end
          end

          return { timeout_ms = 200, lsp_fallback = true }, on_format
         end
      '';
    };

    formatters = {
      squeeze_blanks = {
        command = lib.getExe' pkgs.coreutils "cat";
      };
    };
    keymaps = [
      {
        mode = "";
        key = "<leader>bf";
        action.__raw = ''
          function()
            require('conform').format { async = true, lsp_fallback = true }
          end
        '';
        options = {
          desc = "[F]ormat buffer";
        };
      }
    ];
  };
}
