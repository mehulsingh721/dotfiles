return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Modeline
    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"

    -- File Management
    use "preservim/nerdtree"
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
    use 'ryanoasis/vim-devicons'
    use 'mattn/emmet-vim'

    -- Treesitter - Syntax highlight--
    use { 'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- If TS highlights are not enabled at all, or disabled via `disable` prop,
                -- highlighting will fallback to default Vim syntax highlighting
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { 'org' }, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
                },
                ensure_installed = { 'org' }, -- Or run :TSUpdate org
            }
        end
    }

    use { 'neoclide/coc.nvim', branch = 'release' }
    use "romgrk/doom-one.vim"
    use "tpope/vim-surround"
    use {
        's1n7ax/nvim-terminal',
        config = function()
            vim.o.hidden = true
            require('nvim-terminal').setup()
        end,
    } -- use { 'ibhagwan/fzf-lua',
    --     -- optional for icon support
    --     requires = { 'kyazdani42/nvim-web-devicons' }
    -- }
    -- use { 'junegunn/fzf', run = './install --bin', }
    use { "junegunn/fzf", run = "./install --all" }
    use { "ctrlpvim/ctrlp.vim" }
    use { "tpope/vim-commentary" }
    use { 'anuvyklack/fold-preview.nvim',
        requires = 'anuvyklack/keymap-amend.nvim',
        config = function()
            require('fold-preview').setup()
        end
    }
    use{ "Yggdroot/indentLine"}
end)
