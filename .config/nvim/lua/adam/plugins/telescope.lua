return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- or                              , branch = '0.1.x',

	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		require("telescope").setup({
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = {
						"rg",
						"--files",
						"--no-ignore-vcs",
						"--hidden",
						"-g",
						"!**/node_modules/*",
						"-g",
						"!**/vendor/*",
						"-g",
						"!**/.git/*",
						"-g",
						"!**/.jj/*",
					},
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fl", function()
			builtin.find_files({
				find_command = {
					"rg",
					"--files",
					"--hidden",
					"--no-ignore-vcs",
					"-g",
					"vendor/**",
					"-g",
					"node_modules/**",
					"-g",
					"!**/.git/*",
					"-g",
					"!**/.jj/*",
				},
			})
		end, { desc = "Telescope find files in dependencies" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Telescope commands" })
		vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Telescope LSP definitions" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	end,
}
