vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range("3") },
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	{ src = "https://github.com/saghen/blink.cmp", version = "v1.7.0" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.sessions" },
	{ src = "https://github.com/tpope/vim-surround" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/smjonas/live-command.nvim" },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },

	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" }, -- neotest dependency
	{ src = "https://github.com/V13Axel/neotest-pest" },

	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- depended on by multiple
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- depended on by multiple
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
})

--
-- theme
--
vim.cmd.colorscheme("tokyonight-moon")

--
-- neotree
--
require("neo-tree").setup({
	auto_clean_after_session_restore = true,
	window = {
		width = 40,
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
})

--
-- blink
--
require("blink.cmp").setup({
	keymap = { preset = "default" },
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = { documentation = { auto_show = false } },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = {
		implementation = "prefer_rust_with_warning",
		prebuilt_binaries = {
			force_version = "v1.7.0",
		},
	},
})

--
-- lualine
--
require("lualine").setup({
	options = {
		theme = "tokyonight",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
		lualine_x = {
			--"encoding", --[[ 'fileformat', ]]
			{ "filetype", colored = false },
		},
	},
})

--
-- highlighting
--
require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "python", "c", "lua", "vim", "vimdoc", "query", "htmldjango" },
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	indent = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

--
-- lsp
--
require("mason").setup()
vim.lsp.enable({ "lua_ls", "gdscript", "tailwindcss", "intelephense" })
-- vue/typescript
local vue_language_server_path = vim.fn.expand("$MASON/packages")
	.. "/vue-language-server"
	.. "/node_modules/@vue/language-server"
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}
vim.lsp.config("vtsls", {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
vim.lsp.enable("vtsls")
vim.lsp.enable("vue_ls")

--
-- godot
--
local godot_project = vim.fs.find({ "project.godot" }, { upward = true })
if #godot_project > 0 then
	vim.api.nvim_command('echo serverstart("/tmp/godot.pipe")')
	print("Listening for instructions from Godot.")
end

--
-- command preview
--
require("live-command").setup({
	commands = {
		Norm = { cmd = "norm" },
	},
})
vim.cmd("cnoreabbrev norm Norm")

--
-- testing
--
require("neotest").setup({
	adapters = {
		require("neotest-pest"),
	},
})

--
-- conform (auto-format)
--
require("conform").setup({
	format_on_save = {},
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		html = { "prettier" },
		json = { "prettier" },
		gdscript = { "gdformat" },
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
			cwd = require("conform.util").root_file({
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

--
-- other
--
require("mini.sessions").setup()
require('render-markdown').setup({})

