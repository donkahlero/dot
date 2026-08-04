-- =============================================================================
-- OPTIONS
-- =============================================================================
vim.o.colorcolumn = "81"
vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.encoding = "utf-8"
vim.o.guicursor = ""
vim.o.list = true
vim.o.mousemoveevent = true
vim.o.cursorbind = false
vim.o.scrollbind = false
vim.o.number = true
vim.o.wrap = false
vim.opt.shell = "/bin/sh"

-- =============================================================================
-- EXTERNAL LUA
-- =============================================================================
require("config.lazy")
require("Comment").setup()
require("dap_config")

-- =============================================================================
-- HIGHLIGHTING
-- =============================================================================
vim.cmd.colorscheme("tokyonight-night")

vim.cmd("filetype on")
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = "red", bg = "#db4b4b" })
vim.api.nvim_set_hl(0, "ExtraWhitespace", { ctermbg = "red" })
vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
vim.api.nvim_set_hl(0, "CursorLine", { cterm = {}, ctermbg = 8 })
vim.api.nvim_set_hl(0, "CursorColumn", { cterm = {}, ctermbg = 8 })
vim.o.listchars = [[space:⋅,tab:> ,trail:-,nbsp:+,eol:↵]]

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  callback = function()
    vim.api.nvim_set_hl(0, "ExtraWhitespace", { ctermbg = "none", bg = "none" })
  end,
})

-- =============================================================================
-- MISC SETTINGS
-- =============================================================================
-- lang specific tab settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.opt_local.tabstop = 8
    vim.opt_local.softtabstop = 0
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 8
    vim.opt_local.smarttab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "bzl", "cucumber", "css", "dockerfile", "html", "py" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.autoindent = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 8
    vim.opt_local.softtabstop = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.autoindent = true
    vim.opt_local.colorcolumn = "121"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "typescript" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.autoindent = true
  end,
})

-- clipboard
vim.keymap.set("v", "<leader>y", '"*y')
vim.keymap.set("v", "<leader>p", '"*p')
