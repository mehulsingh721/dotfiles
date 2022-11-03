require("plugins")

-- Components
require("components/modeline")
require("components/filebrowser")
require("keybindings")
require("components/terminal")

local o   = vim.o
local opt = vim.opt
local A   = vim.api
local g = vim.g

o.termguicolors = true

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 1
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true

-- Better editing experience
o.expandtab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 2
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
-- o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.undofile = true
o.swapfile = false
o.mouse = "a"

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

o.backup = false
o.undodir = "/home/lucifer/.vim/undodir"
g.indentLine_char = "|"
g.indentLine_setColors = 1


local ok, _ = pcall(vim.cmd, 'colorscheme doom-one')
