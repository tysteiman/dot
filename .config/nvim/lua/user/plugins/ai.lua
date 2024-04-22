return {
  'Robitx/gp.nvim',
  name = 'ai',
  lazy = false,
  config = function()
    require("gp").setup({
      openai_api_key = { "cat", "/Users/tyler.steiman/.openai" },
    })
  end,
}
