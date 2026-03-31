return {
  "numToStr/Comment.nvim",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("ts_context_commentstring").setup({
      enable_autocmd = false, -- para ser controlado manualmente pelo Comment.nvim
    })

    require("Comment").setup({
      pre_hook = function(ctx)
        -- Para JS/TS/JSX/TSX com Treesitter
        local U = require("Comment.utils")

        -- Usar context-commentstring apenas em buffers com Treesitter ativado
        if vim.bo.filetype == "typescriptreact" or vim.bo.filetype == "javascriptreact" or vim.bo.filetype == "html" then
          return require("ts_context_commentstring.internal").calculate_commentstring({
            key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
          })
        end
      end,
    })
  end,
}
