return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            format_on_save = {},
            formatters_by_ft = {
                lua = { "stylua" },
                rust = { "rustfmt" },
                javascript = {
                    "prettier",
                    "prettierd",
                    stop_after_first = true
                },
                typescript = {
                    "prettier",
                    "prettierd",
                    stop_after_first = true
                },
                vue = {"prettier"},
                c = {
                    "clang-format"
                },
                cpp = { "clang-format" }
            },
            formatters = {
                ["clang-format"] = {
                    append_args = { "--style=WebKit" }
                },
            }
        })
    end
}
