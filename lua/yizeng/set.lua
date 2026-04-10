vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.encoding=utf8
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.lsp.enable({ "jdtls" })
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
-- diagnostic settings
vim.diagnostic.config({
  virtual_text = false,
})

-- Automatically show diagnostics in a floating window after cursor is idle,
-- and close it when the cursor moves or the buffer is left
local diag_win = nil
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    if diag_win and vim.api.nvim_win_is_valid(diag_win) then
      vim.api.nvim_win_close(diag_win, true)
    end
    local _, win = vim.diagnostic.open_float()
    diag_win = win
  end,
})
vim.api.nvim_create_autocmd({ "CursorMoved", "BufLeave" }, {
  callback = function()
    if diag_win and vim.api.nvim_win_is_valid(diag_win) then
      vim.api.nvim_win_close(diag_win, true)
      diag_win = nil
    end
  end,
})
vim.o.updatetime = 1300

-- Show all diagnostics on current line in floating window
vim.keymap.set('n', '<Leader>D', vim.diagnostic.open_float, { noremap = true, silent = true })
-- Go to next/prev diagnostic
vim.keymap.set('n', '<Leader>n', vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>p', vim.diagnostic.goto_prev, { noremap = true, silent = true })
