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

" Enable CursorLine
set cursorline
highlight CursorLine cterm=NONE ctermbg=8 guibg=8

" Enable CursorColumn
set cursorcolumn
highlight CursorColumn cterm=NONE ctermbg=8 guibg=8

" Fun with the mouse and xterm
set mouse=a

" Autocompletion on the menu
set wildmode=longest,list,full
set wildmenu

" (Navigation) Tabs
map <A-Left> gT
map <A-Right> gt

" Tabs and such
" https://stackoverflow.com/a/1878983/3996454
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab smarttab

" Do not clutter my precious folders
set swapfile
set dir=/tmp

" Vundle Plugin Manager Section
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'justincampbell/vim-eighties'
Plugin 'WolfgangMehner/c-support'
Plugin 'vim-syntastic/syntastic'
Plugin 'fatih/vim-go'
Plugin 'ervandew/supertab'
Plugin 'takac/vim-spotifysearch'
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin Settings
" Solarized
syntax enable

" Airline"
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Language Specific Options
" C
" https://www.kernel.org/doc/html/v4.10/process/coding-style.html
autocmd Filetype c setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=8 smarttab
let g:syntastic_c_include_dirs = [ '../include', 'include', '../*' ]

" Go - Requires https://github.com/fatih/vim-go
autocmd BufWrite * if &ft!~?'go'|:call GoImports()|endif
