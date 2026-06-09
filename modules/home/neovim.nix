{ pkgs,...}:
{
  programs.neovim = {
    enable = true;
    sideloadInitLua = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = [
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];
    extraPackages = with pkgs; [
      lua-language-server
      nixd
      nil
      stylua
      nixfmt
    ];
  };
}
