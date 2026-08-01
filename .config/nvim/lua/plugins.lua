vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim",              version = vim.version.range("3") },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	{ src = "https://github.com/saghen/blink.cmp",                         version = "v1.7.0" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.sessions" },
	{ src = "https://github.com/nvim-mini/mini.comment" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-mini/mini.bufremove" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/tpope/vim-surround" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/smjonas/live-command.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/tpope/vim-sleuth" },
	{ src = "https://github.com/mistweaverco/kulala.nvim" },
	{ src = "https://github.com/chaitanyabsprip/fastaction.nvim" },
	{ src = "https://github.com/ccntrq/autoreload.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/nvim-flutter/flutter-tools.nvim" },

	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" }, -- neotest dependency
	{ src = "https://github.com/V13Axel/neotest-pest" },

	{ src = "https://github.com/nvim-lua/plenary.nvim" },    -- depended on by multiple
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- depended on by multiple
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
})

--
-- theme
--
vim.cmd.colorscheme("tokyonight-night")

--
-- neotree
--

-- local function on_move(data)
-- 	require("snacks").rename.on_rename_file(data.source, data.destination)
-- 	print("hi")
-- end
--
-- require("neo-tree").setup({
-- 	auto_clean_after_session_restore = true,
-- 	window = {
-- 		width = 40,
-- 	},
-- 	filesystem = {
-- 		filtered_items = {
-- 			hide_dotfiles = false,
-- 			hide_gitignored = false,
-- 		},
-- 	},
-- 	event_handlers = {
-- 		{ event = "file_moved",   handler = on_move },
-- 		{ event = "file_renamed", handler = on_move },
-- 	},
-- })

--
-- nvim-tree
--

require("nvim-tree").setup()
vim.keymap.set({ "n" }, "<leader>e", ":NvimTreeToggle<Cr>", { noremap = true })

--
-- blink
--
require("blink.cmp").setup({
	keymap = {
		preset = "none",
		['<C-k>'] = { 'select_prev', 'fallback' },
		['<C-j>'] = { 'select_next', 'fallback' },
		['<C-l>'] = { 'select_and_accept', 'fallback' },
	},
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
		theme = "tokyonight-night",
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
vim.lsp.enable({ "lua_ls", "gdscript", "tailwindcss", "intelephense", "gopls", "rust_analyzer", "zls" })
-- vue/typescript
local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
	'/vue-language-server' .. '/node_modules/@vue/language-server'

local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
	name = '@vue/typescript-plugin',
	location = vue_language_server_path,
	languages = { 'vue' },
	configNamespace = 'typescript',
}
local vtsls_config = {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	filetypes = tsserver_filetypes,
}

local ts_ls_config = {
	init_options = {
		plugins = {
			vue_plugin,
		},
	},
	filetypes = tsserver_filetypes,
}

local vue_ls_config = {}

vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.config('ts_ls', ts_ls_config)
vim.lsp.enable({ 'vtsls', 'vue_ls' })
vim.lsp.config('ols', {
	init_options = {
		checker_args = "-strict-style -vet -vet-tabs -warnings-as-errors",
	}
})
vim.lsp.enable('ols')
vim.lsp.config('dartls', {

})
vim.lsp.enable('dartls')

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
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
require("conform").setup({
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		odin = { "odinfmt" },
		gdscript = { "gdformat" },
		go = { "gofmt" },
		markdown = { "mdformat" },
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
		mdformat = {
			prepend_args = { "--wrap", "80" }
		}
	},
})

--
-- other
--
require("mini.sessions").setup()
require("mini.surround").setup()
require("mini.ai").setup()
require("snacks").setup({
	input = { enabled = true },
	picker = { enabled = true },
	rename = { enabled = true },
})
require("autoreload").setup()
require('render-markdown').setup({})
require("kulala").setup({})
require("fastaction").setup({})
require("gitsigns").setup({})
require("flutter-tools").setup({})
