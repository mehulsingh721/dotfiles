require('nvim-terminal').setup({
    toggle_keymap = '<leader>ot',
    terminals = {
        -- keymaps to open nth terminal
        { keymap = 'C-1' },
        { keymap = 'C-2' },
        { keymap = 'C-3' },
        { keymap = 'C-4' },
        { keymap = 'C-5' },
    },
})
