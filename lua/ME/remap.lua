
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv",vim.cmd.Ex)


--move blocks of code in vesion mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--fix the cursor while indenting
vim.keymap.set("n", "J", "mzJ`z")

--fix the cursor in the middle while half page move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--fix the cursor inthe middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--past over text without taking it to copy buffer
vim.keymap.set("x", "<leader>p", [["_dP]])


--copy in system 
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--avoid buffer while delete
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

--don't close vim with Q
vim.keymap.set("n", "Q", "<nop>")


--switch projects
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

