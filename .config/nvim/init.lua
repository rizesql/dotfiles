-- vim.opt.shiftwidth = 4
-- vim.opt.clipboard = "unnamedplus"
-- vim.g.mapleader = " "
-- vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file", silent = true })
-- vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>a", { desc = "Save file in insert mode", silent = true })
-- 
-- vim.keymap.set("v", "<space>x", ":lua<CR>")
-- vim.keymap.set("i", "<C-.>", "<C-x><C-o>", { noremap = true, silent = true })
-- 
-- require("config.lazy")
-- -- vim.keymap.set("n", "-", "<cmd>Oil<CR>")

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

require("vim-options")
require("lazy").setup("plugins")

