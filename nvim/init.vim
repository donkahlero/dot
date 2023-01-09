set colorcolumn=81
set cursorcolumn
set cursorline
set encoding=utf-8
set guicursor=
set list
set nocursorbind
set noscrollbind
set number
set syntax=ON

" ==============================================================================
" HIGHLIGHTING
" ==============================================================================
syntax enable
highlight ColorColumn ctermbg=red
highlight ExtraWhitespace ctermbg=red
:match ExtraWhitespace /\s\+$/
highlight CursorLine cterm=NONE ctermbg=8
highlight CursorColumn cterm=NONE ctermbg=8
set listchars=space:⋅,tab:>\ ,trail:-,nbsp:+,eol:↵

" ==============================================================================
" MISC SETTINGS
" ==============================================================================
" remove whitespaces
autocmd BufWritePre * %s/\s\+$//e
" lang specific tab settings
autocmd Filetype c          setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=8 smarttab
autocmd Filetype css        setlocal tabstop=4 softtabstop=4 expandtab shiftwidth=4 expandtab autoindent
autocmd Filetype dockerfile setlocal tabstop=4 softtabstop=4 expandtab shiftwidth=4 expandtab autoindent
autocmd Filetype html       setlocal tabstop=4 softtabstop=4 expandtab shiftwidth=4 expandtab autoindent
autocmd Filetype py         setlocal tabstop=4 softtabstop=4 expandtab shiftwidth=4 expandtab autoindent
" clipboard
vnoremap <leader>y "*y
vnoremap <leader>p "*p

" ==============================================================================
" DEIN
" ==============================================================================
if &compatible
    set nocompatible
endif

set runtimepath+=/home/jonas/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin('/home/jonas/.cache/dein')
call dein#add('/home/jonas/.cache/dein/repos/github.com/Shougo/dein.vim')
call dein#add("rcarriga/nvim-dap-ui")
call dein#add('LumaKernel/ddc-tabnine')
call dein#add('Shougo/ddc-ui-native')
call dein#add('Shougo/ddc.vim')
call dein#add('Shougo/defx.nvim')
call dein#add('catppuccin/nvim')
call dein#add('lewis6991/gitsigns.nvim')
call dein#add('lukas-reineke/indent-blankline.nvim')
call dein#add('mfussenegger/nvim-dap')
call dein#add('mfussenegger/nvim-dap-python')
call dein#add('ntpeters/vim-better-whitespace')
call dein#add('nvim-lua/plenary.nvim')
call dein#add('nvim-telescope/telescope.nvim')
call dein#add('nvim-tree/nvim-web-devicons')
call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})
call dein#add("rcarriga/nvim-notify")
call dein#add('romgrk/barbar.nvim')
call dein#add('roxma/nvim-yarp')
call dein#add('roxma/vim-hug-neovim-rpc')
call dein#add('t9md/vim-choosewin')
call dein#add('tpope/vim-fugitive')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-denops/denops.vim')
call dein#add('vim-syntastic/syntastic')
call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" ==============================================================================
" CATPUCCIN
" ==============================================================================
"colorscheme catppuccin

" ==============================================================================
" DDC
" ==============================================================================
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['tabnine'])
call ddc#custom#patch_global('sourceOptions', {
    \ 'tabnine': {
    \   'mark': 'TN',
    \   'maxCandidates': 5,
    \   'isVolatile': v:true,
    \ }})
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

call ddc#enable()

" ==============================================================================
" DEFX
" ==============================================================================
nnoremap <C-d> :Defx -split=vertical -winwidth=40 -show-ignored-files -direction=topleft -toggle<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>    defx#do_action('drop')
    nnoremap <silent><buffer><expr> c       defx#do_action('copy')
    nnoremap <silent><buffer><expr> m       defx#do_action('move')
    nnoremap <silent><buffer><expr> p       defx#do_action('paste')
    nnoremap <silent><buffer><expr> l       defx#do_action('open')
    nnoremap <silent><buffer><expr> E       defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P       defx#do_action('preview')
    nnoremap <silent><buffer><expr> o       defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> K       defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N       defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M       defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C       defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S       defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d       defx#do_action('remove')
    nnoremap <silent><buffer><expr> r       defx#do_action('rename')
    nnoremap <silent><buffer><expr> !       defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x       defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy      defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .       defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;       defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h       defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~       defx#do_action('cd')
    nnoremap <silent><buffer><expr> q       defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *       defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j       line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k       line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>   defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>   defx#do_action('print')
    nnoremap <silent><buffer><expr> cd      defx#do_action('change_vim_cwd')
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
let g:airline_theme='catppuccin'
let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 0

" ==============================================================================
" EXTERNAL LUA
" ==============================================================================
lua require('catpuccin_config')
lua require('dap_config')
lua require('devicons_config')
lua require('gitsigns_config')
lua require('indent-blankline_config')
lua require('telescope_config')
lua require('treesitter_config')

