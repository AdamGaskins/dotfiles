-- disable mouse
vim.opt.mouse = ""

-- reload source
vim.keymap.set("n", "<leader>rc", ":source $MYVIMRC<CR>")

-- deletes without yanking
vim.keymap.set({ "x", "n" }, "<leader>d", '"_d')
-- replaces selected text without yanking
vim.keymap.set("x", "<leader>p", '"_dP')

-- center screen after <C-d> <C-u>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- primagen's sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- shortcut for: git log --graph --all --decorate
vim.api.nvim_create_user_command("Glog", function()
	vim.cmd("G log --graph --all --decorate", false)
end, {})

-- debugger
vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ds", ":DapTerminate<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dn", ":DapStepInto<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>do", ":DapStepOver<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })

-- quick switcher
vim.keymap.set("n", "<leader>s", ":ClangdSwitchSourceHeader<CR>")

-- close buffer without messing up window
vim.keymap.set("n", "<leader>bd", ":lua require('mini.bufremove').delete()<CR>", { noremap = true })

-- snacks terminal
vim.keymap.set("n", "<leader>t", ":lua Snacks.terminal.toggle()<CR>")

-- file browser
-- vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")
vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>Yazi toggle<CR>", { desc = "Open yazi at the current file" })
vim.keymap.set({ "n", "v" }, "<leader>yf", "<cmd>Yazi<CR>", { desc = "Open yazi at the current file" })
vim.keymap.set({ "n", "v" }, "<leader>yd", "<cmd>Yazi cwd<CR>", { desc = "Open yazi at the current file" })

vim.keymap.set({ "n", "i" }, "<C-S-h>", "<C-w>h", { noremap = true })
vim.keymap.set({ "n", "i" }, "<C-S-l>", "<C-w>l", { noremap = true })
vim.keymap.set({ "n", "i" }, "<C-S-k>", "<C-w>k", { noremap = true })
vim.keymap.set({ "n", "i" }, "<C-S-j>", "<C-w>j", { noremap = true })
