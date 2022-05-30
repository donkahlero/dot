set nocursorbind
set colorcolumn=81
set cursorcolumn
set cursorline
set encoding=utf-8
set guicursor=
set number
set noscrollbind
set syntax=ON

" ==============================================================================
" HIGHLIGHTING
" ==============================================================================
syntax enable
highlight ColorColumn ctermbg=red
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
highlight CursorLine cterm=NONE ctermbg=8
highlight CursorColumn cterm=NONE ctermbg=8

" ==============================================================================
" MISC SETTINGS
" ==============================================================================
" remove whitespaces
autocmd BufWritePre * %s/\s\+$//e
" lang specific tab settings
autocmd Filetype c setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=8 smarttab
" clipboard
vnoremap <leader>y "*y
vnoremap <leader>p "*p

" ==============================================================================
" DEIN
" ==============================================================================
if &compatible
  set nocompatible
endif

set runtimepath+=/Users/jonas/.vim/bundles/repos/github.com/Shougo/dein.vim

call dein#begin('/Users/jonas/.vim/bundles')
call dein#add('/Users/jonas/.vim/bundles/repos/github.com/Shougo/dein.vim')
call dein#add('Shougo/defx.nvim')
call dein#add('roxma/nvim-yarp')
call dein#add('roxma/vim-hug-neovim-rpc')
call dein#add('tpope/vim-fugitive')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" ==============================================================================
" DEFX
" ==============================================================================
nnoremap <C-d> :Defx -split=vertical -winwidth=35 -direction=topleft -toggle<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
	nnoremap <silent><buffer><expr> <C-d> defx#do_action('open_tree', 'toggle')
endfunction

" ==============================================================================
" VIM-AIRLINE
" ==============================================================================
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline_detect_crypt = 1
let g:airline_detect_spell = 1
let g:airline_detect_spelllang = 1
let g:airline_detect_iminsert = 0
let g:airline_inactive_collapse=1
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 0
