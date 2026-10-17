 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#181818',
    base01 = '#282828',
    base02 = '#323232',
    base03 = '#646464',
    base04 = '#95a99f',
    base05 = '#e4e4ef',
    base06 = '#e4e4ef',
    base07 = '#e4e4ef',
    base08 = '#f43841',
    base09 = '#9e95c7',
    base0A = '#96a6c8',
    base0B = '#ffdd33',
    base0C = '#a596e9',
    base0D = '#ffea80',
    base0E = '#96b0e9',
    base0F = '#becff4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e4e4ef',          bg = '#181818' })
  hi('TelescopeBorder',         { fg = '#646464',             bg = '#181818' })
  hi('TelescopePromptNormal',   { fg = '#e4e4ef',          bg = '#181818' })
  hi('TelescopePromptBorder',   { fg = '#646464',             bg = '#181818' })
  hi('TelescopePromptPrefix',   { fg = '#ffdd33',             bg = '#181818' })
  hi('TelescopePromptCounter',  { fg = '#95a99f',  bg = '#181818' })
  hi('TelescopePromptTitle',    { fg = '#181818',             bg = '#ffdd33' })
  hi('TelescopePreviewTitle',   { fg = '#181818',             bg = '#96a6c8' })
  hi('TelescopeResultsTitle',   { fg = '#181818',             bg = '#9e95c7' })
  hi('TelescopeSelection',      { fg = '#e4e4ef',          bg = '#323232' })
  hi('TelescopeSelectionCaret', { fg = '#ffdd33',             bg = '#323232' })
  hi('TelescopeMatching',       { fg = '#ffdd33',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e4e4ef',          bg = '#181818' })
  hi('MiniPickBorder',         { fg = '#646464',             bg = '#181818' })
  hi('MiniPickPrompt',   { fg = '#e4e4ef',          bg = '#181818' })
  hi('MiniPickPromptPrefix',   { fg = '#ffdd33',             bg = '#181818' })
  hi('MiniPickBorderText',    { fg = '#181818',             bg = '#ffdd33' })
  hi('MiniPickMatchCurrent',      { fg = '#e4e4ef',          bg = '#323232' })
  hi('MiniPickPromptCaret', { fg = '#ffdd33',             bg = '#323232' })
  hi('MiniPickMatchRanges',       { fg = '#ffdd33',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
