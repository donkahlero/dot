" UTF-8 is da shit
set encoding=utf-8

" Show trailing whitepace and spaces before a tab and remove on save
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
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

" (Indent) Tabs
" https://stackoverflow.com/a/1878983/3996454
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab smarttab
" https://www.kernel.org/doc/html/v4.10/process/coding-style.html
autocmd Filetype c setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=8 smarttab

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
" ==============================================================================
" OPTIONS
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_id_checkers = 1
let g:syntastic_sort_aggregated_errors = 0
let g:syntastic_echo_current_error = 1
let g:syntastic_cursor_column = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = ">>"
let g:syntastic_style_error_symbol = "S>"
let g:syntastic_warning_symbol = ">>"
let g:syntastic_style_warning_symbol = "S>"
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 10
let g:syntastic_ignore_files = []
let g:syntastic_filetype_map = {}
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["c", "go"],
    \ "passive_filetypes": [] }
let g:syntastic_quiet_messages = {}
let g:syntastic_stl_format = "[Syntax: line:%F (%t)]"
let g:syntastic_nested_autocommands = 0
let g:syntastic_debug = 0
let g:syntastic_extra_filetypes = []
" ==============================================================================
" CHECKERS & LANG OPTIONS
let g:syntastic_c_include_dirs = [ '../include', 'include', '../*' ]
let g:syntastic_go_checkers = ['golint', 'govet', 'gometalinter']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" vim-go - http://github.com/fatih/vim-go
" ==============================================================================
" SETTINGS
let g:go_test_show_name = 1
let g:go_test_timeout= '5s'
let g:go_play_browser_command = 'firefox %URL% &'
let g:go_play_open_browser = 1
let g:go_auto_type_info = 0
let g:go_info_mode = 'guru'
let g:go_auto_sameids = 0
let g:go_updatetime = 800
let g:go_jump_to_error = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {}
let g:go_fmt_fail_silently = 0
let g:go_fmt_experimental = 0
let g:go_doc_keywordprg_enabled = 1
let g:go_doc_max_height = 25
let g:go_doc_url = 'https://godoc.org'
let g:go_def_mode = 'guru'
let g:go_def_mapping_enabled = 1
let g:go_def_reuse_buffer = 0
let g:go_doc_command = ["godoc"]
let g:go_bin_path = "$GOPATH/bin"
let g:go_snippet_engine = "automatic"
let g:go_get_update = 1
let g:go_guru_scope = []
let g:go_build_tags = ''
let g:go_autodetect_gopath = 1
let g:go_textobj_enabled = 1
let g:go_textobj_include_function_doc = 1
let g:go_textobj_include_variable = 1
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_disabled = []
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "10s"
let g:go_list_height = 10
let g:go_list_type = ""
let g:go_list_type_commands = {}
let g:go_list_autoclose = 1
let g:go_asmfmt_autosave = 0
let g:go_alternate_mode = "edit"
let g:go_gorename_prefill = 'expand("<cword>") =~# "^[A-Z]"' .
          \ '? go#util#pascalcase(expand("<cword>"))' .
          \ ': go#util#camelcase(expand("<cword>"))'
let g:go_gocode_autobuild = 1
let g:go_gocode_propose_builtins = 1
let g:go_gocode_unimported_packages = 0
let g:go_gocode_socket_type = 'unix'
let g:go_template_autocreate = 1
let g:go_template_file = "hello_world.go"
let g:go_template_test_file = "hello_world_test.go"
let g:go_template_use_pkg = 0
let g:go_echo_command_info = 1
let g:go_echo_go_info = 1
let g:go_statusline_duration = 60000
let g:go_addtags_transform = 'snakecase'
let g:go_debug = []
" ==============================================================================
" SYNTAX HIGHLIGHTING
let g:go_fold_enable = []
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 0
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 0 " Taken care of above
let g:go_highlight_operators = 0
let g:go_highlight_functions = 0
let g:go_highlight_function_arguments = 0
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 0
let g:go_highlight_fields = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 0
let g:go_highlight_variable_assignments = 0
