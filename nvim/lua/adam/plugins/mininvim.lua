return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.ai').setup {}
        require('mini.pairs').setup {}
        require('mini.comment').setup {}
        require('mini.surround').setup {}
    end
}
