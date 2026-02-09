{
  programs.nixvim = {
    plugins.vimwiki = {
      enable = true;
      settings = {
        hl_cb_checked = 1;
        hl_headers = 1;

        listsym_rejected = "✗";
        listsyms = "○◐●✓";
        use_calendar = 1;
      };
    };
  };
}
