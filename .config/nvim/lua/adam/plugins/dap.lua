return {
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	"mfussenegger/nvim-dap",
	config = function()
		require("dapui").setup({})

		local dap = require("dap")
		dap.adapters.lldb = {
			type = "executable",
			command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
			name = "lldb",
		}

		-- instead, add a launch.json
		-- dap.configurations.c = {
		-- 	{
		-- 		name = "Launch",
		-- 		type = "lldb",
		-- 		request = "launch",
		-- 		program = function()
		-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		-- 		end,
		-- 		cwd = "${workspaceFolder}",
		-- 		stopOnEntry = false,
		-- 		args = {},
		-- 	},
		-- }
	end,
}
