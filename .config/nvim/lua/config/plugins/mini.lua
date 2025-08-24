return {
  -- Mini.nvim core (required for all modules)
  { "echasnovski/mini.nvim", version = false },

  -- Mini Comment (with ts-context-commentstring support)
  {
    "echasnovski/mini.comment",
    version = false,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })

      require("mini.comment").setup({
        options = {
          custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring({ key = "commentstring" })
              or vim.bo.commentstring
          end,
        },
      })
    end,
  },

  -- Mini Files (file explorer)
  {
    "echasnovski/mini.files",
    config = function()
      local MiniFiles = require("mini.files")
      MiniFiles.setup({
        mappings = {
          go_in = "<CR>",
          go_in_plus = "L",
          go_out = "-",
          go_out_plus = "H",
        },
      })

      -- vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })

      -- vim.keymap.set("n", "<leader>ef", function()
      --   MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
      --   MiniFiles.reveal_cwd()
      -- end, { desc = "Reveal current file in explorer" })
    end,
  },

  -- Mini Surround
  {
    "echasnovski/mini.surround",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      highlight_duration = 300,
      mappings = {
        add = "sa",
        delete = "ds",
        find = "sf",
        find_left = "sF",
        highlight = "sh",
        replace = "sr",
        update_n_lines = "sn",
        suffix_last = "l",
        suffix_next = "n",
      },
      n_lines = 20,
      respect_selection_type = false,
      search_method = "cover",
      silent = false,
    },
  },

  -- Mini Trailspace (trim whitespace)
  {
    "echasnovski/mini.trailspace", -- ✅ fixed: was commented out
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local miniTrailspace = require("mini.trailspace")

      miniTrailspace.setup({
        only_in_normal_buffers = true,
      })

      vim.keymap.set("n", "<leader>cw", function()
        miniTrailspace.trim()
      end, { desc = "Erase trailing whitespace" })

      vim.api.nvim_create_autocmd("CursorMoved", {
        pattern = "*",
        callback = function()
          miniTrailspace.unhighlight()
        end,
      })
    end,
  },

  -- Mini SplitJoin (toggle inline/block formatting)
  {
    "echasnovski/mini.splitjoin",
    config = function()
      local miniSplitJoin = require("mini.splitjoin")
      miniSplitJoin.setup({
        mappings = { toggle = "" }, -- disable default mapping
      })

      vim.keymap.set({ "n", "x" }, "sj", function()
        miniSplitJoin.join()
      end, { desc = "Join arguments" })

      vim.keymap.set({ "n", "x" }, "sk", function()
        miniSplitJoin.split()
      end, { desc = "Split arguments" })
    end,
  },
}
