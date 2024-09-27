-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim
require("lazy").setup("plugins")

require('lazy').setup({
  {
    'kylechui/nvim-surround',
    -- version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }
})

-- https://www.perplexity.ai/search/set-nvim-background-to-transpa-NsWREIJ9RDaMS.rfQqiZbg
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   callback = function()
--     vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
--     vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", ctermbg = "NONE" })
--   end
-- })

-- https://www.perplexity.ai/search/is-it-possible-to-set-nvim-on-umvu7YCQTkKimnsPfovOBQ
-- For Lua (.lua) configuration
vim.cmd[[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
]]

