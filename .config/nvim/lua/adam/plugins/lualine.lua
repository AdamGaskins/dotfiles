return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.opt.showmode = false

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
	end,
}
