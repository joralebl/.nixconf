{
  pkgs,
  nixvim,
  ...
}: {
  imports = [
    nixvim.homeModules.nixvim
    ./nixvim.nix
    ./keys.nix
    ./plugins/conform.nix
    ./plugins/nvim-cmp.nix
    ./plugins/lsp.nix
    ./plugins/treesitter.nix
    ./plugins/which-key.nix
    ./plugins/mini.nix
    # ./plugins/telescope.nix
    ./plugins/undotree.nix
    #./plugins/dap.nix
    #./plugins/harpoon.nix
    ./plugins/toggleterm.nix
    ./plugins/vimwiki.nix
	# ./plugins/render-markdown.nix
  ];
}
