{pkgs, ...}: {
  programs.nixvim = {
    # Highlight, edit, and navigate code
    # https://nix-community.github.io/nixvim/plugins/treesitter/index.html
    plugins.treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
	  additional_vim_regex_highlighting = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        make
        markdown
        nix
        regex
        toml
        vim
        vimdoc
        yaml
        jsdoc
        latex
        python
        javascript
        typescript
        svelte
        go
        gomod
        gosum
        rust
        elixir
        erlang
        c
        cpp
        cmake
        html
        htmldjango
        css
        ruby
      ];

      # TODO: Don't think I need this as nixGrammars is true which should auto install these???
      # settings = {
      #   highlight = {
      #     enable = true;
      #
      #     # Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      #     additional_vim_regex_highlighting = true;
      #   };
      #
      #   indent = {
      #     enable = true;
      #     disable = [
      #       "ruby"
      #     ];
      #   };
      # };
      # There are additional nvim-treesitter modules that you can use to interact
      # with nvim-treesitter. You should go explore a few and see what interests you:
      #
      #    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      #    - Show your current context: https://nix-community.github.io/nixvim/plugins/treesitter-context/index.html
      #    - Treesitter + textobjects: https://nix-community.github.io/nixvim/plugins/treesitter-textobjects/index.html
    };
    plugins.treesitter-context = {
      enable = true;
    };
  };
}
