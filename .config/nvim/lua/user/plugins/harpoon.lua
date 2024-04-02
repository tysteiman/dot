return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      local wk = require('which-key')

      wk.register({
        h = {
          name = 'Harpoon',
          a = { function() harpoon:list():append() end, 'Add file' },
          h = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, 'View' },

          ['1'] = { function() harpoon:list():select(1) end, 'Harpoon 1' },
          ['2'] = { function() harpoon:list():select(1) end, 'Harpoon 2' },
          ['3'] = { function() harpoon:list():select(1) end, 'Harpoon 3' },
          ['4'] = { function() harpoon:list():select(1) end, 'Harpoon 4' },
          ['5'] = { function() harpoon:list():select(1) end, 'Harpoon 5' },
          ['6'] = { function() harpoon:list():select(1) end, 'Harpoon 6' },
          ['7'] = { function() harpoon:list():select(1) end, 'Harpoon 7' },
          ['8'] = { function() harpoon:list():select(1) end, 'Harpoon 8' },
          ['9'] = { function() harpoon:list():select(1) end, 'Harpoon 9' },
          ['0'] = { function() harpoon:list():select(1) end, 'Harpoon 10' },
        },
      }, { prefix = '<leader>' })
    end,
  }
}
