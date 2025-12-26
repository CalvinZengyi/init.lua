vim.g.mapleader = " "

-- back to normal mode
vim.keymap.set({ "i", "c", "t" }, "jk", "<esc>", { desc = "Back to normal mode" })
vim.keymap.set("x", "<C-c>", "<esc>", { desc = "Back to normal mode under visual mode." })
-- save file
vim.keymap.set("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file" })

-- no arrow

vim.keymap.set({ "i", "n" }, "<Up>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<Left>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<Right>", "<Nop>")
vim.keymap.set({ "i", "n" }, "<Down>", "<Nop>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- go to definition
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- find references

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ea", 'oassert.NoError(err, "")<Esc>F";a')

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/yizeng/lazy_init.lua<CR>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
