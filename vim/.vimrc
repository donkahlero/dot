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

" For ...Python...
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle Plugin Manager Section
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'WolfgangMehner/c-support'
Plugin 'vim-syntastic/syntastic'
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin Settings
" NERDTree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Ailrine"
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
