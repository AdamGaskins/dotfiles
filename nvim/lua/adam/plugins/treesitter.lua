local M = {
    "nvim-treesitter/nvim-treesitter",
    config = function()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
	    ensure_installed = { "vue", "javascript", "typescript", "php", "html", "vimdoc", "lua" },
	    
            highlight = {
                enable = true,
	        additional_vim_regex_highlighting = false,
            },

	    sync_install = false,
	    auto_install = true,
	    indent = { enable = true },
        })
    end,
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}

return { M }
