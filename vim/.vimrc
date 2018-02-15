"UTF-8 is da shit
set encoding=utf-8

" Show trailing whitepace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Or even automatically remove that schtick:
autocmd BufWritePre * %s/\s\+$//e

" Enable red line after 80th column
highlight ColorColumn ctermbg=red
set colorcolumn=81

" Enable line numbers
set number

" Tabs and such
set tabstop=8 softtabstop=0 expandtab shiftwidth=8 smarttab

" For ...Python...
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle Plugin Manager Section
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'justincampbell/vim-eighties'
Plugin 'WolfgangMehner/c-support'
Plugin 'vim-syntastic/syntastic'
Plugin 'fatih/vim-go'
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin Settings
" Solarized
syntax enable
set background=dark
colorscheme solarized

" NERDTree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1
			\ && exists("b:NERDTree")
			\ && b:NERDTree.isTabTree()) | q | endif

" Airline"
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_include_dirs = [ '../include', 'include', '../*' ]
