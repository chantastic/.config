return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm",
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
    },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    -- Only set the colorscheme if it hasn't been set already
    if vim.g.colors_name ~= "tokyonight" then
      vim.cmd[[colorscheme tokyonight]]
    end
  end,
}
