" UTF-8 is da shit
set encoding=utf-8

" Syntax highlighting
syntax enable

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
call vundle#end()
filetype plugin indent on

" vim-airline
" ==============================================================================
" OPTIONS
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

" NERDTree
" ==============================================================================
" OPTIONS
" let g:loaded_nerd_tree = 0
let g:NERDTreeAutoCenter = 1
let g:NERDTreeAutoCenterThreshold = 5
let g:NERDTreeCaseSensitiveSort = 0
let g:NERDTreeNaturalSort = 1
let g:NERDTreeChDirMode = 0
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeIgnore = ['\~$']
let g:NERDTreeRespectWildIgnore = 0
let g:NERDTreeBookmarksFile = $HOME.'/.NERDTreeBookmarks'
let g:NERDTreeBookmarksSort = 1
let g:NERDTreeMarkBookmarks = 1
let g:NERDTreeMouseMode = 1
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeShowFiles = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeSortOrder = ['\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeStatusline = -1
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 30
let g:NERDTreeMinimalUI = 1
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeCascadeOpenSingleChildDir = 0
let g:NERDTreeAutoDeleteBuffer = 0
let g:NERDTreeCreatePrefix = "silent"
" ==============================================================================
" KEY MAPPINGS
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


" c-support - https://github.com/WolfgangMehner/c-support
let g:C_CCompiler = 'gcc'
let g:C_CExtension = 'c'
let g:C_CFlags = '-Wall -g -O0 -c' "EXPAND
let g:C_CodeCheckExeName = 'check'
let g:C_CodeCheckOptions = ''
let g:C_CodeSnippets = $HOME.'/.vim/bundle/c-support/codesnippets/'
let g:C_CplusCompiler = 'g++'
let g:C_Ctrl_j = 'off'
let g:C_CustomTemplateFile = $HOME.'/.vim/templates/c.templates'
let g:C_Debugger = 'gdb'
let g:C_Dictionary_File = ''
let g:C_ExeExtension = ''
let g:C_GlobalTemplateFile = $HOME.'/.vim/bundle/c-support/templates/Templates'
let g:C_GuiSnippetBrowser = 'commandline'
let g:C_InsertFileHeader = 'no'
let g:C_LFlags = '-Wall -g -O0'
let g:C_Libs = '-lm'
let g:C_LineEndCommColDefault = 49
let g:C_LoadMenus = 'yes'
let g:C_CreateMenusDelayed = 'yes'
let g:C_LocalTemplateFile = $HOME.'/.vim/c-support/templates/Templates'
let g:C_Man = 'man'
let g:C_MapLeader = '\'
let g:C_NonCComment = '#'
let g:C_ObjExtension = '.o'
let g:C_OutputGvim = 'vim'
let g:C_Printheader = "%<%f%h%m%<  %=%{strftime('%x %X')}     Page %N"
let g:C_RootMenu = '&C\/C\+\+.'
let g:C_SourceCodeExtensions = 'c cc cp cxx cpp'
let g:C_TypeOfH = 'c'
let g:C_VimCompilerName = 'gcc'
let g:Xterm_Executable = 'kitty'
let g:Xterm_Options = ''

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
