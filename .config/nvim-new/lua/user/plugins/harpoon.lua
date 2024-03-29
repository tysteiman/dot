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

      vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
      vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
      vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
      vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
      vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
      vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
      vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)
      vim.keymap.set("n", "<leader>0", function() harpoon:list():select(10) end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
    end,
  }
}
