function apply(func, ...)
	local args = { ... }
	return function()
		func(unpack(args))
	end
end

vim.g.mapleader = " "

-- deletes/replaces without yanking
vim.keymap.set({ "x", "n" }, "<leader>d", '"_d')
vim.keymap.set("x", "<leader>p", '"_dP')

-- center screen after <C-d> <C-u>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- primagen's sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- debugger
vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ds", ":DapTerminate<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dn", ":DapStepInto<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>do", ":DapStepOver<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })

-- testing
vim.keymap.set("n", "<leader>tn", function()
	require("neotest").run.run()
	require("neotest").summary.open()
end)
vim.keymap.set("n", "<leader>tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
	require("neotest").summary.open()
end)
vim.keymap.set("n", "<leader>ts", function()
	require("neotest").run.run({ suite = true })
	require("neotest").summary.open()
end)
vim.keymap.set("n", "<leader>tt", function()
	--require("neotest").output.open({ enter = true })
end)

-- close buffer without messing up window
vim.keymap.set("n", "<leader>bd", ":lua require('mini.bufremove').delete()<CR>", { noremap = true })

-- file browser
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")

-- restart
vim.keymap.set("n", "<leader>r", function()
	MiniSessions.write("restart.vim")
	vim.cmd(
		"restart lua MiniSessions.read('restart.vim'); MiniSessions.delete('restart.vim', {force = true, verbose = false})"
	)
end)

-- navigate windows with Control + hjkl
vim.keymap.set({ "n", "i" }, "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set({ "n", "i" }, "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set({ "n", "i" }, "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set({ "n", "i" }, "<C-j>", "<C-w>j", { noremap = true })

--
-- telescope/lsp
--
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Find Grep" })
vim.keymap.set("n", "<leader>fb", apply(telescope.buffers, { sort_mru = true }), { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Find Help Tags" })
vim.keymap.set("n", "<leader>fs", telescope.lsp_document_symbols, { desc = "Find Symbols" })
vim.keymap.set("n", "<leader>fq", telescope.quickfix, {})
vim.keymap.set("n", "<leader>fk", telescope.keymaps, {})
vim.keymap.set("n", "gd", telescope.lsp_definitions, {})
vim.keymap.set("n", "gt", telescope.lsp_type_definitions, {})
vim.keymap.set("n", "gi", telescope.lsp_implementations, {})
vim.keymap.set("n", "gr", telescope.lsp_references)
vim.keymap.set("n", "gs", vim.lsp.buf.signature_help) -- same as hover?
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set({ "n", "x" }, "<leader>lf", require("conform").format)
