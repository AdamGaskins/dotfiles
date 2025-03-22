function MyColorscheme(color)
  color = color or "kanagawa"
  vim.cmd.colorscheme(color)
end

return {    
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').setup({
        disable_Background = true
      })

      MyColorscheme()
    end,
  },
}
