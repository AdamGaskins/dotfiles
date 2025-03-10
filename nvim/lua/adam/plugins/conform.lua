return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            format_on_save = {},
            formatters_by_ft = {
              javascript = { "prettier", "prettierd", stop_after_first = true },
              vue = { "prettier" },
            },
        })
    end
}