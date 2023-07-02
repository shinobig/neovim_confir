local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "BurntSushi/ripgrep",
    lazy=false
  },
  {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    lazy=false
},
{
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
  end,
    lazy=false
},
{
  'prettier/vim-prettier',
  lazy=false
},
{
  "github/copilot.vim",
  lazy=false
},
{
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
  },
  lazy=false
}
-- {
--   'Equilibris/nx.nvim',
--   requires = {
--       'nvim-telescope/telescope.nvim',
--   },
--   config = function()
--       require("nx").setup({
--         -- Base command to run all other nx commands, some other values may be:
--         -- - `npm nx`
--         -- - `yarn nx`
--         -- - `pnpm nx`
--         nx_cmd_root = 'nx',
    
--         -- Command running capabilities,
--         -- see nx.m.command-runners for more details
--         command_runner = require('nx.command-runners').terminal_cmd(),
--         -- Form rendering capabilities,
--         -- see nx.m.form-renderers for more detials
--         form_renderer = require('nx.form-renderers').telescope(),
    
--         -- Whether or not to load nx configuration,
--         -- see nx.loading-and-reloading for more details
--         read_init = true,
--     })
--   end,
--   lazy=false
-- }
-- {
  
--   "nvim-treesitter/nvim-treesitter",
--   lazy=false
-- },


  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
