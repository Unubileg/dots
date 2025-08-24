
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "andrew-george/telescope-themes",
    "nvim-telescope/telescope-ui-select.nvim", -- optional: UI select extension
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        themes = {
          enable_previewer = true,
          enable_live_preview = true,
          persist = {
            enabled = true,
            path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
          },
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({})
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("themes")
    telescope.load_extension("ui-select") -- optional

    -- 🔑 Keymaps

    -- File-related
    vim.keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })

    vim.keymap.set("n", "<leader>pWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, { desc = "Find word under cursor" })

    vim.keymap.set("n", "<leader>ths", "<cmd>Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })

    -- LSP-related
    vim.keymap.set("n", "gD", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to definition (Telescope)" })
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Find references" })
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Find implementations" })
    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Find type definitions" })
    vim.keymap.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
    vim.keymap.set("n", "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })
  end,
}
