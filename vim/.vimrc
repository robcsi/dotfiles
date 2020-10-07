"not compatible mode with Vi
set nocompatible

"using vim-plug, automatic downloading of the plugin itself
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs --insecure
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/L9'
Plug 'derekwyatt/vim-fswitch'
"Plug 'q335r49/microviche'
Plug 'vim-scripts/project.tar.gz'
Plug 'szw/vim-ctrlspace'
Plug 'majutsushi/tagbar'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/vim-signature'
Plug 'rking/ag.vim'
Plug 'tpope/vim-unimpaired'
Plug 'inside/vim-search-pulse'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-surround'
Plug 'wellle/visual-split.vim'
Plug 'tpope/vim-sleuth'
"Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-vinegar'
Plug 'robcsi/viewmaps.vim'
Plug 'tpope/vim-repeat'
Plug 't9md/vim-quickhl'
Plug 'cosminadrianpopescu/vim-tail'
Plug 'dikiaap/minimalist'
Plug 'robcsi/gvfilter.vim'
"Plug 'w0rp/ale'
Plug 'jremmen/vim-ripgrep'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
Plug 'vifm/vifm.vim'
Plug 'mcchrish/nnn.vim'
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'
call plug#end()

set guioptions=c

filetype on
filetype plugin on
filetype indent on

"enable syntax and toggle it to on
syntax enable
syntax on
if !has('gui_running')
  set t_Co=256
endif

set noswapfile

"Windows specific settings
if has("win32")
    "source $VIMRUNTIME/vimrc_example.vim
    "source $VIMRUNTIME/mswin.vim
    "behave mswin

    "x on an English Windows version. n on a French one
    au GUIEnter * simalt ~x 

    "Perforce revert, edit and add command
    "!start runs a command without supressing VIm and waiting for a keypress
    "http://vim.wikia.com/wiki/Execute_external_programs_asynchronously_under_Windows
    "nnoremap <C-S-Ins> :!start cmd /c "C:\Program files\Perforce\p4.exe" add %<CR>
    "nnoremap <C-S-A-Ins> :!start cmd /c "C:\Program files\Perforce\p4.exe" edit %<CR>
    "nnoremap <C-S-Del> :!start cmd /c "C:\Program files\Perforce\p4.exe" delete %<CR>
    "nnoremap <C-S-A-Del> :!start cmd /c "C:\Program files\Perforce\p4.exe" revert %<CR>

    " Tell vim to remember certain things when we exit
    "  '10  :  marks will be remembered for up to 10 previously edited files
    "  "100 :  will save up to 100 lines for each register
    "  :20  :  up to 20 lines of command-line history will be remembered
    "  %    :  saves and restores the buffer list
    "  n... :  where to save the viminfo files

    set viminfo=h,<500,'1000,\"100,:20,%,nc:\\temp\\.vim\\_viminfo

    set undodir=c:\temp\.vim\undodir
    set backupdir=c:\temp\.vim
    set directory=c:\temp\.vim

    "setting gui font
    set guifont=Consolas:h10:cANSI

    set tags=./tags,tags
else
"*nix specific settings
    set undodir=~/.vim/undodir
    set backupdir=~/.vim
    set directory=~/.vim

    "setting the default font
    "http://vim.wikia.com/wiki/Change_font
    set guifont=Monospace\ Bold\ 8

    set viminfo=h,<500,'1000,\"100,:20,%,n~/_viminfo

    set tags=./tags,tags
endif

"restoring the last cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" Don't use Ex mode, use Q for formatting
"vnoremap Q gq
"nnoremap Q gqap

"colors and gui settings
"if has("gui_running")
set background=light
colorscheme minimalist
"else
    "colorscheme desert
    "set background=dark
"endif

"colorscheme primary
"set background=light

"solarized colorscheme settings
"default value is normal
" let g:solarized_contrast="high"
"default value is normal
" let g:solarized_visibility="high"
"default value is 1
" let g:solarized_italic=0

"no highlight search as default
set nohlsearch

"always nowrap text
set nowrap

" Show (partial) command in status line.
set showcmd		    
" Show matching brackets.
set showmatch
" Do case insensitive matching
set ignorecase
" Do smart case matching
set smartcase
" Incremental search
set incsearch		
" Automatically save before commands like :next and :make
set autowrite		

"Taken from here: http://items.sjbach.com/319/configuring-vim-right
" Hide buffers when they are abandoned
set hidden          
" Enable mouse usage (all modes)
set mouse=a

"use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
"show matching paranthesis
set showmatch                   
" display the current mode
set noshowmode                    

" highlight current column
"set cursorcolumn
" highlight bg color of current line
hi cursorline guibg=#333333     
" highlight cursor
hi cursorcolumn guibg=#333333

"enable cursorline
set nocursorline

"set verbose=1

" automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

" function for calling Ctags on current directory
function! UpdateTags()
  "execute ":!ctags -R --fields=+liaS --c-kinds=+p --c++-kinds=+p --sort=yes --tag-relative --extra=+q ."
  "echohl StatusLine | echo "C/C++/C\# tag updated" | echohl None
  execute ":!ctags -R"
  echohl StatusLine | echo "Tags updated" | echohl None
endfunction
nnoremap <F4> :call UpdateTags()<CR> "robi

"automatically change directory when opening a file
set autochdir
" Switch pwd to whichever file I'm current editing
autocmd BufEnter * lcd %:p:h 

nnoremap ' `
nnoremap ` '

"for gundo plugin
set undofile
set undolevels=100

set history=1000

"use extended matching
runtime macros/matchit.vim

set title

set nobackup
set writebackup

"scroll by 3 lines
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

set ruler

"set visualbell

set backspace=indent,eol,start

"Taken from: http://vim.wikia.com/wiki/Example_vimrc
set nostartofline

"yank to the end of the line
nnoremap Y y$

"Taken from: http://amix.dk/vim/vimrc.html
set scrolloff=7

"autoread file when it has changed
set autoread

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

"http://vim.wikia.com/wiki/Folding
"set foldmethod=marker
set foldmethod=manual
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" tab navigation like firefox - http://vim.wikia.com/wiki/Alternative_tab_navigation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>

" move through word wrapped line
nnoremap k gk
nnoremap j gj

" to support Unicode fully
set enc=utf-8

" Source the vimrc file after saving it
if has("autocmd")
    augroup VimrcSo
        au!

        autocmd! bufwritepost $MYVIMRC source $MYVIMRC
    augroup END
endif

" easily open the vimrc in a new tab
nmap <leader>v :tabedit $MYVIMRC<CR>

"width of the fold column
set foldcolumn=4

"number of characters at which VIM will start scrolling horizontally when text
"is not wrapped
set sidescroll=10
set sidescrolloff=10

"show tabs and trailing spaces when using :set list nicer
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<

" Always show the status line
set laststatus=2

" https://github.com/bling/vim-airline/tree/dev#smarter-tab-line
" let g:airline#extensions#tabline#enabled = 0
" let g:airline_powerline_fonts = 1
"let g:airline_theme='dark'
"autocmd VimEnter * :AirlineRefresh
" let g:airline_disable_statusline = 1

"setting numbers and relativenumbers
set number
set relativenumber

"settings for path and file searching in project dirs
"set wildchar=n
set wildmode=full
set wildmenu
"set wildignore=*.dll

"search for only these types of files with find
set suffixesadd=.h,.c,.hpp,.cpp,.cs,.resx,.xsd,.xml,.csproj,.vcxproj,.sln,.rc,.sch,.imp,.bat
"set the path variable in Vim
set path=.,**,,

"Always show the tab bar
set showtabline=1

" Do not jump to the matching bracket upon bracket insert (default)
let g:matchparen_insert_timeout=5

" Use the OS clipboard by default
set clipboard=unnamed

" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces

"how to deal with TABs: expand them to 4 spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"http://www.youtube.com/watch?v=aHm36-na4-4
"set textwidth=80
"call matchadd('ColorColumn', '\%81v', 100)

"Adding Unix and Windows common settings for sessions
set sessionoptions+=unix,slash

"some settings for TagHighlight plugin
"autocmd VimEnter * :UpdateTypesFile
"nnoremap <silent> <leader>u :UpdateTypesFile<CR>

"http://www.reddit.com/r/vim/comments/1qp1su/is_my_ideal_tabwindowbuffer_setup_possible/
"jump to a buffer where it is instead of right here by using :sb
set switchbuf=useopen,usetab

"remap TAB to %; easier way to match
"nnoremap <tab> %

"remap n and N to center next search result, and pulse the line
nnoremap n nzzzv
nnoremap N Nzzzv

"same for next and previous match
nnoremap g; g;zz
nnoremap g, g,zz

"Open quickfix window containing all the matches of a search
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:botright copen<CR>

"Focus current fold
nnoremap <leader>z zMzvzz

"Split the line
" nnoremap S i<cr><esc><right>

"toggling paste mode
set pastetoggle=<F8>

"toggling GUndo plugin
nnoremap <F3> :GundoToggle<CR>

" switching to alternate file
nnoremap <leader>a :FSHere<CR>

" highlight last inserted text
nnoremap gV `[v`]

set lazyredraw

"http://www.reddit.com/r/vim/comments/2362q1/let_mapleader_now_how_do_i_get_rid_of_that_delay/
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

" project.vim settings
let g:proj_window_increment = 100
let g:proj_window_width = 40
let g:proj_flags = "imstgTSLn"
nnoremap <silent> <Leader>p :Project<CR> | :set winfixwidth

" CtrlSpace settings
nnoremap <silent><C-p> :CtrlSpace O<CR>
let g:ctrlspace_show_tab_info = 1
let g:ctrlspace_show_key_info = 1
let g:ctrlspace_show_unnamed = 1
let g:ctrlspace_use_horizontal_splits = 1
let g:CtrlSpaceProjectRootMarkers = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS", ".sln"]
let g:CtrlSpaceUseUnicode = 0
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSearchTiming = 500
let g:CtrlSpaceFileEngine = "auto"
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
"colors
"hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
"hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
"hi CtrlSpaceFound    ctermfg=220  ctermbg=NONE cterm=bold
hi CtrlSpaceSelected term=reverse ctermfg=white ctermbg=black cterm=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=black ctermbg=228   cterm=NONE
hi CtrlSpaceFound    ctermfg=125  ctermbg=NONE  cterm=bold

" TagBar settings
let g:tagbar_width = 60
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers = 1
"let g:tagbar_expand = 1
let g:tagbar_autoshowtag = 1
"let g:tagbar_left = 1
nnoremap <F2> :TagbarToggle<CR>

" descreasing updatetime
set updatetime=1000

" rainbow_parentheses settings
" always on
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

" adding newline before the current line and after
nnoremap OO O<Esc>
nnoremap oo o<Esc>

" jumping back and forth between matches of */# and centering
map z' ''zz

" vim-search-pulse config
"https://github.com/inside/vim-search-pulse
let g:vim_search_pulse_mode = 'pattern'
let g:vim_search_pulse_duration = 250

set ttyfast

"autosave when focus is lost
"autocmd FocusLost * :wa

"strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"shortcut for SemanticHighlight
nnoremap <leader>sh :SemanticHighlightToggle<cr>

" shortcuts for wildfire
nnoremap <leader>sw <Plug>(wildfire-quick-select)

"peekaboo settings
let g:peekaboo_window = 'vertical botright 80new'

"Ag mapping
nnoremap <silent> <leader>Ag :AsyncRun Ag <c-r><c-w> .<cr>:botright copen<CR>

"netrw calling shortcut
nnoremap - :Ex<cr>
let g:netrw_preview   = 1
let g:netrw_liststyle = 1
let g:netrw_winsize   = 30

"shortcut for counting occurence of word under cursor in file
nnoremap <leader>C :%s/<c-r><c-w>//gn<cr>

"toggle quickfix
nnoremap <silent> <F10> :call asyncrun#quickfix_toggle(12)<cr>

" Don't move when you use * 
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" open help in vertical split directly
command! -nargs=* -complete=help Help vertical belowright help <args>

" run shell commands and get their output in your file
nnoremap Q !!sh<cr>

" shortcut to insert current date in file
nnoremap <leader>D i<C-R>=strftime("%Y %b %d")<cr><esc>

"shortcut to ViewMaps normal mode
nnoremap <silent> <leader>dn :ViewMaps n quickfix<CR>
"shortcut to ViewMaps insert mode
nnoremap <silent> <leader>di :ViewMaps i quickfix<CR>
"shortcut to ViewMaps visual mode
nnoremap <silent> <leader>dv :ViewMaps v quickfix<CR>

"quickhl shortcuts
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)

"gvfilter mappings
nnoremap <leader>gg :GVFilterGFilter 
nnoremap <leader>gv :GVFilterVFilter 
nnoremap <leader>gr :GVFilterRepeatLast<CR>
nnoremap <leader>gs :GVFilterStart<CR>
nnoremap <leader>gt :GVFilterStop<CR>
nnoremap <leader>gl :GVFilterShowLast<CR>

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
      \ },
      \ }
function! LightlineFilename()
  let filename = expand('%:p') !=# '' ? expand('%:p') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

let g:coc_disable_startup_warning = 1

"FZF
let g:fzf_history_dir = '~'

map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"FloatTerm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" let g:floaterm_keymap_toggle = '<F5>'
" let g:floaterm_keymap_next   = '<F6>'
" let g:floaterm_keymap_prev   = '<F7>'
" let g:floaterm_keymap_new    = '<F8>'

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
set timeoutlen=100

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
let g:which_key_map['v'] = [ ':Vifm'                      , 'vifm' ]
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map['T'] = [ ':Ag'                        , 'search text' ]
let g:which_key_map['V'] = [ '<C-W>v'                     , 'split right']

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'r' : [':Rg'           , 'text Rg'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" Register which key map
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'v' : [':FloatermNew vifm'                              , 'vifm'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ }

call which_key#register('<Space>', "g:which_key_map")

"QuickScope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

"Sneak
let g:sneak#label = 1
" case insensitive sneak
let g:sneak#use_ic_scs = 1
" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1
" remap so I can use , and ; with f and t
map gS <Plug>Sneak_,
map gs <Plug>Sneak_;
" Change the colors
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow
" Cool prompts
" let g:sneak#prompt = '🕵'
" let g:sneak#prompt = '🔎'

