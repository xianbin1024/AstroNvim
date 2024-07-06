-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

return {
  {
    "uloco/bluloco.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },

  {
    "luisiacc/gruvbox-baby",
  },

  {
    "sainnhe/gruvbox-material",
  },

  {
    "EdenEast/nightfox.nvim",
  },

  {
    "AstroNvim/astroui",
    opts = {
      -- change colorscheme: "bluloco-dark", "gruvbox-baby", "gruvbox-material", "astrodark"
      colorscheme = "nightfox",
    }
  },
}
