set colorcolumn=81
set cursorcolumn
set cursorline
set encoding=utf-8
set guicursor=
set list
set mousemoveevent
set nocursorbind
set noscrollbind
set number
set nowrap

" ==============================================================================
" EXTERNAL LUA
" ==============================================================================
lua require("config.lazy")
lua require('Comment').setup()
lua require('dap_config')
lua vim.lsp.enable('copilot')

" ==============================================================================
" HIGHLIGHTING
" ==============================================================================
colorscheme tokyonight-night

filetype on
filetype plugin indent on
syntax on
highlight ColorColumn ctermbg=red
highlight ExtraWhitespace ctermbg=red
:match ExtraWhitespace /\s\+$/
highlight CursorLine cterm=NONE ctermbg=8
highlight CursorColumn cterm=NONE ctermbg=8
set listchars=space:⋅,tab:>\ ,trail:-,nbsp:+,eol:↵
autocmd Filetype dashboard highlight ExtraWhitespace ctermbg=none guibg=none

" ==============================================================================
" MISC SETTINGS
" ==============================================================================
" remove whitespaces - now handled by ALE
" autocmd BufWritePre * %s/\s\+$//e
" lang specific tab settings
autocmd Filetype c		setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=8 smarttab
autocmd Filetype bzl,cucumber,css,dockerfile,html,py
	\ setlocal tabstop=4 softtabstop=4 expandtab shiftwidth=4 expandtab autoindent
autocmd Filetype go		setlocal tabstop=8 softtabstop=8 shiftwidth=8 autoindent colorcolumn=121
autocmd Filetype lua,typescript
	\ setlocal tabstop=2 softtabstop=2 expandtab shiftwidth=2 expandtab autoindent

" clipboard
vnoremap <leader>y "*y
vnoremap <leader>p "*p


