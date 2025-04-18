return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    local wk = require('which-key')

    wk.register({
      h = {
        name = 'Harpoon',
        a = { function() harpoon:list():add() end, 'Add file' },
        h = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, 'View' },
      },
    }, { prefix = '<leader>' })

    wk.register({
      ['1'] = { function() harpoon:list():select(1) end, 'Harpoon 1' },
      ['2'] = { function() harpoon:list():select(2) end, 'Harpoon 2' },
      ['3'] = { function() harpoon:list():select(3) end, 'Harpoon 3' },
      ['4'] = { function() harpoon:list():select(4) end, 'Harpoon 4' },
      ['5'] = { function() harpoon:list():select(5) end, 'Harpoon 5' },
      ['6'] = { function() harpoon:list():select(6) end, 'Harpoon 6' },
      ['7'] = { function() harpoon:list():select(7) end, 'Harpoon 7' },
      ['8'] = { function() harpoon:list():select(8) end, 'Harpoon 8' },
      ['9'] = { function() harpoon:list():select(9) end, 'Harpoon 9' },
    }, { prefix = '<leader>' })
  end,
}
