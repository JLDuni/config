return {
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },

    event = "VeryLazy",
    opts = function(_, opts)
      opts.views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            min_width = 60,
            width = "auto",
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 1, 2 },
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 23,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
            max_height = 15,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = {
              Normal = "Normal",
              FloatBorder = "NoiceCmdlinePopupBorder",
            },
          },
        },
      }

      opts.lsp = opts.lsp or {}
      opts.lsp.signature = {
        opts = { size = { max_height = 15 } },
      }

      opts.presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      }
    end,
    config = function()
      require("noice").setup()
    end,
  },
  {
    "hrsh7th/cmp-cmdline",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },

    config = function()
      local cmp = require("cmp")
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
    end,
  },
}
