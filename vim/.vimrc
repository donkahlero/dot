" ALL VIM OPTIONS (SEE options.txt)
" ==============================================================================

" A
" ==============================================================================
set aleph=224
set noallowrevins
set noaltkeymap
set ambiwidth=single
set noantialias
set noautochdir
set noarabic
set arabicshape
set autoindent
set noautoread
set noautowrite
set noautowriteall

" B
" ==============================================================================
" set background=dark " TODO causes rendering issues ATM.
" set backspace& " TODO we need correct settings here
set backup
set backupcopy=auto
set backupdir=/tmp
set backupext=~
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set balloondelay=600
set noballooneval
set balloonexpr=
set belloff=all
set nobinary
set nobomb
set breakat=\ ^I!@*-+;:,./?
set nobreakindent
set breakindentopt=
set browsedir=last
set bufhidden=
set buflisted
set buftype=

" C
" ==============================================================================
set casemap=internal,keepascii
set cdpath=$CDPATH
set cedit=<C-F>
set charconvert=
set nocindent " TODO ENABLE LATER
set cinkeys=0{,0},0),:,0#,!^F,o,O,e
set cinoptions=
set cinwords=if,else,while,do,for,switch
set clipboard=autoselect,exclude:cons\|linux " TODO IMPROVE LATER
set cmdheight=1
set cmdwinheight=7
set colorcolumn=81
" set columns=80 " ENABLE WHEN NECESSARY
set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
set commentstring=/*%s*/
set compatible& " Keep default. Do nothing here. Will interefere with below.
set complete=.,w,b,u,t,i
set completefunc=
set completeopt=menu,preview
set concealcursor=
set conceallevel=0
set confirm
set nocopyindent
set cpoptions=aABceFs
set cryptmethod=zip
set cscopepathcomp=0
set cscopeprg=cscope
set cscopequickfix=
set nocscoperelative
set nocscopetag
set cscopetagorder=0
set nocscopeverbose
set nocursorbind
set cursorcolumn
set cursorline

" D
" ==============================================================================
set debug=
set define=^\\s*#\\s*define
set nodelcombine
set dictionary=
set nodiff
set diffexpr=
set diffopt=filler
set nodigraph
set directory=/tmp,~/tmp
set display& " TODO revise

" E
" ==============================================================================
set eadirection=both
set noedcompatible
set noemoji
set encoding=utf-8
set endofline
set equalalways
set equalprg=
set noerrorbells
set errorfile=/var/log/vim-errors.log
set errorformat& " As default is 'very long', we omit.
set noesckeys

set mouse=a
set number
set swapfile
set wildmode=longest,list,full
set wildmenu


" HIGHLIGHTING
" ==============================================================================
syntax enable
" red line after 80th column
highlight ColorColumn ctermbg=red
" trailing whitepace and spaces before a tab
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" cursor
highlight CursorLine cterm=NONE ctermbg=8 guibg=8
highlight CursorColumn cterm=NONE ctermbg=8 guibg=8


" MISC SETTINGS
" ==============================================================================
" remove whitespaces
autocmd BufWritePre * %s/\s\+$//e
" tabs (separate for c, so we make sure to follow the holy linx coding style)
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab smarttab
autocmd Filetype c setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=8 smarttab


" MAPPINGS
" ==============================================================================
map <A-Left> gT
map <A-Right> gt
map <C-n> :NERDTreeToggle<CR>


" Vundle Plugin Manager Section
" ==============================================================================
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


" syntastic
" ==============================================================================
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
" checkers & lang options
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
