vim.env.PATH = "/Users/adam/Library/Application Support/Herd/config/nvm/versions/node/v22.8.0/bin:" .. vim.env.PATH

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
			-- 'hrsh7th/cmp-nvim-lsp',
			-- 'hrsh7th/nvim-cmp'
		},
		opts = {
			servers = {
				lua_ls = {},
			},
		},
		config = function(_, opts)
			-- Reserve a space in the gutter
			-- This will avoid an annoying layout shift in the screen
			vim.opt.signcolumn = "yes"

			-- Add cmp_nvim_lsp capabilities settings to lspconfig
			-- This should be executed before you configure any language server
			-- local lspconfig_defaults = require('lspconfig').util.default_config
			-- lspconfig_defaults.capabilities = vim.tbl_deep_extend('force', lspconfig_defaults.capabilities,
			--     require('cmp_nvim_lsp').default_capabilities())

			-- This is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = {
						buffer = event.buf,
					}

					-- commented out lines are replaced with Telescope keybinds
					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
					vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				end,
			})

			require("mason").setup({})
			require("mason-lspconfig").setup({
				-- handlers = {function(server_name)
				--    require('lspconfig')[server_name].setup({})
				-- end}
			})

			local mason_registry = require("mason-registry")
			local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"
			local lspconfig = require("lspconfig")
			require("lspconfig").ts_ls.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_language_server_path,
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				settings = {
					completions = {
						completeFunctionCalls = true,
					},
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			})

			-- No need to set `hybridMode` to `true` as it's the default value
			require("lspconfig").volar.setup({
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
					},
				},
				init_options = {
					vue = {
						hybridMode = false,
					},
				},
			})

			require("lspconfig").tailwindcss.setup({})

			require("lspconfig").clangd.setup({})

			require("lspconfig").phpactor.setup({})
			--require("lspconfig").intelephense.setup({})

			require("lspconfig").rust_analyzer.setup({})

			-- local cmp = require('cmp')
			-- cmp.setup({
			--     sources = {{
			--         name = 'nvim_lsp'
			--     }},
			--     preselect = 'item',
			--     completion = {
			--         completeopt = 'menu,menuone,noinsert'
			--     },
			--     mapping = cmp.mapping.preset.insert({
			--         -- Navigate between completion items
			--         ['<C-p>'] = cmp.mapping.select_prev_item({
			--             behavior = 'select'
			--         }),
			--         ['<C-n>'] = cmp.mapping.select_next_item({
			--             behavior = 'select'
			--         }),

			--         -- `Enter` key to confirm completion
			--         ['<CR>'] = cmp.mapping.confirm({
			--             select = true
			--         }),

			--         -- Ctrl+Space to trigger completion menu
			--         ['<C-Space>'] = cmp.mapping.complete()
			--     }),
			--     snippet = {
			--         expand = function(args)
			--             vim.snippet.expand(args.body)
			--         end
			--     }
			-- })

			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			-- 	vim.diagnostic.config({
			-- 		-- update_in_insert = true,
			-- 		float = {
			-- 			-- focusable = false,
			-- 			-- style = "minimal",
			-- 			-- border = "rounded",
			-- 			-- source = "always",
			-- 			-- header = "",
			-- 			-- prefix = ""
			-- 		},
			-- 	})
		end,
	},
}
