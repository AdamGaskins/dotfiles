return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local util = require("conform.util")
		require("conform").setup({
			format_on_save = {},
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				html = { "prettier" },
				javascript = {
					"prettier",
					"prettierd",
					stop_after_first = true,
				},
				typescript = {
					"prettier",
					"prettierd",
					stop_after_first = true,
				},
				vue = { "prettier" },
				c = {
					"clang-format",
				},
				cpp = { "clang-format" },
				php = {
					"pint",
					cwd = util.root_file({
						"artisan",
					}),
					require_cwd = true,
				},
			},
			formatters = {
				["clang-format"] = {
					append_args = { "--style=WebKit" },
				},
			},
		})
	end,
}
