vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.swapfile = false

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file", silent = true })
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>a", { desc = "Save file in insert mode", silent = true })

vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("i", "<C-.>", "<C-x><C-o>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
