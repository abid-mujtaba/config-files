-- Use lazy.nvim as the plugin manager (downloads itself automatically the first time)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "ggandor/leap.nvim",
    "tpope/vim-commentary",
    "tpope/vim-surround",
})

-- Key Mappings
vim.api.nvim_set_keymap("i", "jk", "<esc>", {noremap = true})

-- Enable leap
require("leap").add_default_mappings()
