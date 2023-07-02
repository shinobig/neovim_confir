---@type MappingsTable

local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-+>"] = {"20<C-w>>", "Expand window width"},
    ["<C-_>"] = {"20<C-w><", "Reduce window width"},
    ["<S-DOWN>"] = {"10j", "Move down fast"},
    ["<S-UP>"] = {"10k", "Move up fast"},
    ["<C-w>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

-- more keybinds!


M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>pf"] = { "<cmd> Telescope grep_string <CR>", "Find Files" },
   -- ["<leader>pf"] = {
   --   function ()
   --     require("telescope").grep_string({search = vim.fn.input("Grep > ")})
   --   end,
   --   "Project Finder"
   -- }
  },
}

M.lsp_lines = {
  n = {
    ["<leader>te"] = {
      function()
        require("lsp_lines").toggle ""
      end,
      "Toggle lsp_lines"
    }
  }
}

M.prettier = {
  n = {
["<leader>fm"] = {"<cmd>Prettier<CR>", "Prettier"}
  }
}

return M

