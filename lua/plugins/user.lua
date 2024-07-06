return {
  { "stevearc/aerial.nvim", enabled = false },

  {
    "dstein64/nvim-scrollview",
    config = function(plugin, opts)
      require('scrollview').setup({
        excluded_filetypes = {'neo-tree'},
        current_only = true,
        signs_on_startup = {'all'},
        diagnostics_severities = {vim.diagnostic.severity.ERROR}
      })
    end
  },

  {
    "liuchengxu/vista.vim",
    config = function(plugin, opts)
      vim.keymap.set("n", "<F2>", "<cmd>Vista!!<CR>", { desc = "Toggle vista view window"})
    end
  },

  {
    "jay-babu/project.nvim",
    config = function(plugin, opts)
      require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = {".nvim.pro"},
      })
    end
  },

  {
    "xianbin1024/cscope_maps.nvim",
    dependencies = {
      "xianbin1024/vim-gutentags",
    },

    config = function(plugin, opts)
      -- enable gtags module: ctags, gtags_cscope or cscope_maps
      vim.g.gutentags_modules = {"gtags_cscope"}
      -- config project root markers.
      vim.g.gutentags_project_root = {".nvim.pro"}
      -- generate datebases in my cache directory, prevent gtags files polluting my project
      vim.g.gutentags_cache_dir = vim.fn.expand("~/gtags")
      vim.g.gutentags_gtags_dbpath = ""
      -- change focus to quickfix window after search (optional).
      vim.g.gutentags_plus_switch = 1
      vim.g.gutentags_auto_add_gtags_cscope = 0
      -- vim.g.gutentags_trace = 1

      require("cscope_maps").setup({
        -- maps related defaults
        disable_maps = false, -- "true" disables default keymaps
        skip_input_prompt = false, -- "true" doesn't ask for input
        prefix = "<leader>z", -- prefix to trigger maps

        -- cscope related defaults
        cscope = {
          -- location of cscope db file
          -- DB or table of DBs
          -- NOTE:
          --   when table of DBs is provided -
          --   first DB is "primary" and others are "secondary"
          --   primary DB is used for build and project_rooter
          --   secondary DBs must be built with absolute paths
          --   or paths relative to cwd. Otherwise JUMP will not work.
          -- db_file = { vim.fn.getcwd(), "cscope.out" },
          -- cscope executable
          exec = "gtags-cscope", -- "cscope" or "gtags-cscope"
          -- choose your fav picker
          picker = "telescope", -- "telescope", "fzf-lua" or "quickfix"
          -- size of quickfix window
          -- qf_window_size = 10, -- any positive integer
          -- position of quickfix window
          -- qf_window_pos = "bottom", -- "bottom", "right", "left" or "top"
          -- "true" does not open picker for single result, just JUMP
          skip_picker_for_single_result = false, -- "false" or "true"
          -- these args are directly passed to "cscope -f <db_file> <args>"
          db_build_cmd_args = { "-bqkv" },
          -- statusline indicator, default is cscope executable
          -- statusline_indicator = nil,
          -- try to locate db_file in parent dir(s)
          project_rooter = {
            enable = false, -- "true" or "false"
            -- change cwd to where db_file is located
            change_cwd = false, -- "true" or "false"
          },
        }
      })
    end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    config = function(plugin, opts)
      require("hlslens").setup({})
    end,
  },

  {
    "hachy/cmdpalette.nvim",
    config = function(plugin, opts)
      require("cmdpalette").setup({
        win = { title = "Command" },
      })
      vim.keymap.set("n", ":", "<Plug>(cmdpalette)")
    end,
  },

  {
    "sindrets/diffview.nvim",
  },

--[[
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "stevearc/aerial.nvim",
    config = function(plugin, opts)
      require("aerial").setup({
        layout = {
          default_direction = "right",
        },
        open_automatic = true,
        close_automatic_events = { "unsupported" },
      })
    end,
  },
]]
}
