return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local nvimtree = require('nvim-tree')
    local api = require('nvim-tree.api')

    -- Recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Configure nvim-tree with fixed side
    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
        side = 'right', -- Fixed to right side
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '', -- Arrow when folder is closed
              arrow_open = '', -- Arrow when folder is open
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { '.DS_Store' },
      },
      git = {
        ignore = false,
      },
    })

    -- Function to toggle tree visibility
    local function toggle_tree()
      if api.tree.is_visible() then
        api.tree.close()
        print('NvimTree closed')
      else
        api.tree.open()
        print('NvimTree opened')
      end
    end

    -- Set keymaps
    local keymap = vim.keymap
    keymap.set('n', '<leader>ee', toggle_tree, { desc = 'Toggle file explorer visibility' })
    keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' })
    keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
    keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })
  end,
}
