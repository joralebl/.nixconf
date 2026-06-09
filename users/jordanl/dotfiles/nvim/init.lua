vim.pack.add({
    'https://github.com/nvim-mini/mini.nvim',
    'https://github.com/nvim-mini/mini.misc',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/blazkowolf/gruber-darker.nvim',
    'https://github.com/Mofiqul/dracula.nvim',
    'https://github.com/tpope/vim-sleuth',
})
require('nvim-treesitter').setup()
require('gruber-darker').setup()
require('dracula').setup()
vim.cmd.colorscheme('gruber-darker')

require('mini.basics').setup({
    options = {
        basic = true,
        extra_ui = true,
        win_borders = 'double',
    },
    mappings = {
        basic = true,
        option_toggle_prefix = "",
        windows = true,
        move_with_alt = true,
    },
    autocommands = {
        basic = true,
        relnum_in_visual_mode = false,
        silent = true,
    },
})
require('mini.surround').setup()
require('mini.starter').setup()
require('mini.files').setup()
local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = { 'n', 'x' }, keys = '<Leader>' },

        -- `[` and `]` keys
        { mode = 'n',          keys = '[' },
        { mode = 'n',          keys = ']' },

        -- Built-in completion
        { mode = 'i',          keys = '<C-x>' },

        -- `g` key
        { mode = { 'n', 'x' }, keys = 'g' },

        -- Marks
        { mode = { 'n', 'x' }, keys = "'" },
        { mode = { 'n', 'x' }, keys = '`' },

        -- Registers
        { mode = { 'n', 'x' }, keys = '"' },
        { mode = { 'i', 'c' }, keys = '<C-r>' },

        -- Window commands
        { mode = 'n',          keys = '<C-w>' },

        -- `z` key
        { mode = { 'n', 'x' }, keys = 'z' },
    },
    clues = {
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
})
require('mini.icons').setup()
require('mini.notify').setup()
require('mini.statusline').setup()
require('mini.pick').setup()
require('mini.extra').setup()
require('mini.bufremove').setup()
require('mini.git').setup()
require('mini.cmdline').setup()
require('mini.indentscope').setup()
require('mini.cursorword').setup()
require('mini.hipatterns').setup()
require('mini.trailspace').setup()
require('vim._core.ui2').enable({})
require('mini.comment').setup()
require('mini.diff').setup({ style = 'sign' })

vim.lsp.enable({
    'lua_ls',
    'bashls',
    'gopls',
    'ts_ls',
    'rust-analyzer',
    'nixd',
    'nil_ls',
    'elp',
    'zls',
    'elixirls',
    'pyright',
    'nim_langserver',
    'ocamllsp',
    'emmet_language_server',
})


-- settings
local opt = vim.opt

opt.swapfile = false
opt.relativenumber = true
opt.expandtab = true
opt.scrolloff = 10
opt.hlsearch = false
opt.inccommand = "split"
opt.updatetime = 250
opt.timeoutlen = 300
opt.pumborder = "solid"
opt.showbreak = "+++"
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.softtabstop = 4
opt.autocomplete = true
opt.copyindent = true

opt.completeopt = "menu,menuone,noselect,popup,fuzzy"
opt.backspace = "indent,eol,start"
opt.hidden = true
opt.autochdir = false
opt.clipboard = "unnamedplus"

vim.cmd.filetype("plugin indent on")
vim.diagnostic.config({ virtual_text = true })

vim.g.have_nerd_font = true

-- KEYMAPS
local keymap = vim.keymap.set
local s = { silent = true }
local opts = { noremap = true, silent = true }

keymap("n", "<space>", "<Nop>")
keymap("n", "<Leader>w", "<cmd>w!<CR>", s)                    -- Save the current file
keymap("n", "<Leader>q", "<cmd>q<CR>", s)                     -- Quit Neovim
keymap("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", s) -- Format the current buffer using LSP
keymap("t", "<Esc>", "<C-\\><C-N>")                           -- Exit terminal mode
keymap("n", "<Leader>ef", ":lua MiniFiles.open()<CR>", s)
keymap("n", "<Leader>ec", ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", s)
keymap("i", "jk", "<Esc>", s)


--undo checkpoints on punctuation
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
keymap("i", ";", ";<c-g>u")

--keymap("i", "`", "``<left>")
--keymap("i", '"', '""<left>')
--keymap("i", "(", "()<left>")
--keymap("i", "[", "[]<left>")
--keymap("i", "{", "{}<left>")
--keymap("i", "<", "<><left>")

-- Better paste
keymap("v", "p", '"_dP', opts)

-- better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- jump to init.lua
keymap("n", "<Leader>ev", ":e ~/.config/nvim/init.lua<CR>")

--mini-bufremove
keymap("n", "<Leader>bdc", ":lua MiniBufremove.delete()<CR>", { desc = "Delete the current buffer" })
keymap("n", "<Leader>buc", ":lua MiniBufremove.unshow_in_window()<CR>", { desc = "Unshow this buffer from current window" })
keymap("n", "<Leader>bua", ":lua MiniBufremove.unshow()<CR>", { desc = "Unshow this buffer from all windows" })

--mini-pick


-- AUTOCOMMANDS
local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
    return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end


autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

autocmd("LspAttach", {
    group = augroup("lsp_completion"),
    callback = function(args)
        local client_id = args.data.client_id
        if not client_id then
            return
        end

        local client = vim.lsp.get_client_by_id(client_id)
        if client and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client_id, args.buf, {
                autotrigger = true,
            })
        end
    end,
})
