set colorcolumn=81
set cursorcolumn
set cursorline
set encoding=utf-8
set guicursor=
set list
set nocursorbind
set noscrollbind
set number
set nowrap

" ==============================================================================
" EXTERNAL LUA
" ==============================================================================
lua require("config.lazy")
lua require('Comment').setup()
lua require('cmp_config')
lua require('dap_config')
lua require('indent-blankline_config')
lua require('lsp_config')

" ==============================================================================
" HIGHLIGHTING
" ==============================================================================
colorscheme catppuccin-mocha

filetype on
filetype plugin indent on
syntax on
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
autocmd Filetype c		setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=8 smarttab
autocmd Filetype bzl,cucumber,css,dockerfile,html,py
	\ setlocal tabstop=4 softtabstop=4 expandtab shiftwidth=4 expandtab autoindent
autocmd Filetype go		setlocal tabstop=8 softtabstop=8 shiftwidth=8 autoindent colorcolumn=121
autocmd Filetype lua,typescript
	\ setlocal tabstop=2 softtabstop=2 expandtab shiftwidth=2 expandtab autoindent

" clipboard
vnoremap <leader>y "*y
vnoremap <leader>p "*p


" ==============================================================================
" VIM-AIRLINE
" ==============================================================================
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline_detect_crypt = 1
let g:airline_detect_spell = 1
let g:airline_detect_spelllang = 1
let g:airline_detect_iminsert = 0
let g:airline_inactive_collapse = 1
let g:airline_theme = 'catppuccin'
let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 0

" ==============================================================================
" VIM-GO
" ==============================================================================
let g:go_code_completion_enabled = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "gopls"
let g:go_gopls_gofumpt = 1

" ==============================================================================
" vim-asciidoctor
" ==============================================================================
fun! AsciidoctorMappings()
    nnoremap <buffer> <leader>oo :AsciidoctorOpenRAW<CR>
    nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
    nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
    nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
    nnoremap <buffer> <leader>ch :Asciidoctor2HTML<CR>
    nnoremap <buffer> <leader>cp :Asciidoctor2PDF<CR>
    nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
    nnoremap <buffer> <leader>p :AsciidoctorPasteImage<CR>
    " :make will build pdfs
    compiler asciidoctor2pdf
endfun

augroup asciidoctor
    au!
    au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END
