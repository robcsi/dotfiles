"not compatible mode with Vi
set nocompatible

filetype on
filetype plugin on
filetype indent on

syntax enable
syntax on

"using vim-plug, automatic downloading of the plugin itself
if has("win32")
    if empty(glob('c:/Users/siar/.nvim/autoload/plug.vim'))
      silent !curl -fLo c:/Users/siar/.nvim/autoload/plug.vim --create-dirs --insecure
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $VIM\sysinit.vim
    endif
else
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs --insecure
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

if has("win32")
    call plug#begin('c:/Users/siar/.nvim/plugged')
else
    call plug#begin('~/.config/nvim/plugged')
endif
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
Plug 'simnalamburt/vim-mundo'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
Plug 'voldikss/vim-floaterm'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-eunuch'
Plug 'joshdick/onedark.vim'
Plug 'vifm/vifm.vim'
Plug 't9md/vim-quickhl'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dyng/ctrlsf.vim'
Plug 'rust-lang/rust.vim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'preservim/tagbar'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'stsewd/fzf-checkout.vim'
Plug 'samoshkin/vim-mergetool'
Plug 'kassio/neoterm'
call plug#end()

set guioptions=c

colorscheme onedark

set number
set mouse=a
set relativenumber

" no highlight search as default
set nohlsearch

set noshowmode

"always nowrap text
set wrap

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

set foldmethod=indent
set nofoldenable

set list lcs=tab:\|\ 

set title

"Taken from: http://vim.wikia.com/wiki/Example_vimrc
set nostartofline

"Taken from: http://amix.dk/vim/vimrc.html
set scrolloff=7

"automatically change directory when opening a file
set autochdir
" Switch pwd to whichever file I'm current editing
" autocmd BufEnter * lcd %:p:h 

" Use the OS clipboard by default
set clipboard=unnamed

set wildmode=full
set wildmenu

" to support Unicode fully
set enc=utf-8

" Always show the status line
set laststatus=2

set history=1000

"http://www.reddit.com/r/vim/comments/1qp1su/is_my_ideal_tabwindowbuffer_setup_possible/
"jump to a buffer where it is instead of right here by using :sb
set switchbuf=useopen,usetab

"how to deal with TABs: expand them to 4 spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set hidden

set inccommand=split

"set tabline
set cursorline
set relativenumber
set smartcase
set ignorecase

if has("win32")
    au GUIEnter * simalt ~x 
    set guifont=Consolas:h10
else
    set guifont=FiraCode\ Nerd\ Font\ Mono:h11
endif

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=1000

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" somehow works in tmux now...
if has("termguicolors")
    set termguicolors
endif


" highlight current column
"set cursorcolumn
" highlight bg color of current line
hi cursorline guibg=#333333     
" highlight cursor
hi cursorcolumn guibg=#333333

" Source the vimrc file after saving it
"if has("autocmd")
"    augroup VimrcSo
"        au!
"
"        autocmd! bufwritepost $MYVIMRC source $MYVIMRC
"    augroup END
"endif


"restoring the last cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

"scroll by 3 lines
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

nnoremap ' `
nnoremap ` '

"yank to the end of the line
nnoremap Y y$

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" move through word wrapped line
nnoremap k gk
nnoremap j gj

" tab navigation like firefox - http://vim.wikia.com/wiki/Alternative_tab_navigation
nnoremap <leader>.   :tabnext<CR>
nnoremap <leader>, :tabprevious<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>

"toggling GUndo plugin
nnoremap <F5> :MundoToggle<CR>

"remap n and N to center next search result, and pulse the line
nnoremap n nzzzv
nnoremap N Nzzzv

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

"peekaboo settings
let g:peekaboo_window = 'vertical botright 80new'

"FZF
let g:fzf_history_dir = '~'

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9, 'relative': v:true } }

" let $FZF_DEFAULT_OPTS='--reverse --color=dark --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'
let $FZF_DEFAULT_OPTS='--reverse'

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

let g:fzf_tags_command = 'ctags -R'
let g:fzf_preview_window = ['down:50%', 'ctrl-/']
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" fzf-checkout settings
let g:fzf_checkout_git_options = '--sort=-committerdate'

" mappings
map <SPACE> <leader>

nnoremap <leader><SPACE> :Files<CR>
nnoremap <leader>f :CtrlSF <C-r><C-w><CR>
nnoremap <leader>C :Commits<CR>
nnoremap <leader>B :BCommits<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Tags<CR>
nnoremap <leader>G :GFiles?<CR>
nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>g :Gcd<CR>
nnoremap <leader>s :G<CR>
nnoremap <silent><leader>e :CocCommand explorer --sources=buffer+,file+ --position=floating --floating-width -60<CR>
"--open-action-strategy=vsplit
nnoremap <leader>q :xall!<CR>
nnoremap <leader>p :vsplit<CR> \| :terminal git push<CR>i
nnoremap <leader>v :CocSearch -S 
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <silent>K :call <SID>show_documentation()<CR>
nnoremap <leader>S :Startify<CR>
nnoremap <leader><tab> :Maps<CR>

"shortcut for counting occurence of word under cursor in file
nnoremap <leader>c :%s/<c-r><c-w>//gn<cr>

"quickhl shortcuts
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
" map H <Plug>(operator-quickhl-manual-this-motion)

" custom substitute/sed mapping to shortcut the replacement of work under cursor
nmap <leader>z :%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>

" mapping for next and previous buffer
" nnoremap <leader>. :bnext<CR>
" nnoremap <leader>, :bprev<CR>

" shortcut to insert current date in file
nnoremap <leader>D a **<C-R>=strftime("%Y %b %d @ %H:%M")<cr>** <esc>

" open help in vertical split directly
command! -nargs=* -complete=help Help vertical belowright help <args> | vertical resize 85

" function to show documentation for word under cursor
" uses Help command above!!!
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
      execute 'Help '.expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>i <Plug>(coc-format)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <C-l>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" how to exit quickly from Insert mode
inoremap <special> kj <ESC> 
inoremap <special> jk <ESC>:

" Floaterm
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

"netrw calling shortcut
"nnoremap - :Ex<cr>
" let g:netrw_preview   = 1
" let g:netrw_liststyle = 1
" let g:netrw_winsize   = 30

"lightline config
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'githunksummary', 'cocstatus'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
      \   'githunksummary': 'GitHunkSummary',
      \   'cocstatus': 'coc#status',
      \ },
      \ }

function! LightlineFilename()
  let filename = expand('%:p') !=# '' ? expand('%:p') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! GitHunkSummary()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('gs: +%d ~%d -%d', a, m, r)
endfunction

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
autocmd FileType json syntax match Comment +\/\/.\+$+

"===========================================================================
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F <Plug>(coc-format-selected)
nmap <leader>F <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" disable python2 provider/neovim
let g:loaded_python_provider = 0

" vimwiki setup
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown'}

" vim-markdown
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
" example
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle
let g:mkdp_browser = 'qutebrowser'

" CtrlSF
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
let g:ctrlsf_auto_preview = 1
let g:ctrlsf_default_view_mode = 'compact'

"Maximixer & VimSpector

fun GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

"Maximizer
let g:maximizer_set_default_mapping = 1

"VimSpector

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-node-debug2', 'vscode-bash-debug' ]

nnoremap <silent><leader>tm :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>dl <Plug>VimspectorStepInto
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" vim-mergetool plugin settings
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'
nmap <leader>mt <plug>(MergetoolToggle)
" smart diff exchange commands
nmap <expr> <C-Left> &diff? '<Plug>(MergetoolDiffExchangeLeft)' : '<C-Left>'
nmap <expr> <C-Right> &diff? '<Plug>(MergetoolDiffExchangeRight)' : '<C-Right>'
nmap <expr> <C-Down> &diff? '<Plug>(MergetoolDiffExchangeDown)' : '<C-Down>'
nmap <expr> <C-Up> &diff? '<Plug>(MergetoolDiffExchangeUp)' : '<C-Up>'

" Settings for Mundo
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.undo
let g:mundo_width = 60
let g:mundo_preview_height = 20
let g:mundo_right = 1
let g:mundo_preview_bottom = 1
let g:mundo_auto_preview = 1

" git gutter mappings -- these are available by default
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap <leader>gf :GitGutterFold<CR>
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)
command! Gqf GitGutterQuickFix | copen
nmap <leader>hq :Gqf<CR>
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_highlight_lines = 0

let g:fzf_branch_actions = {
      \ 'track': {'keymap': 'ctrl-t'},
      \}

" tagbar width
let g:tagbar_width = 70
let g:tagbar_autofocus = 1

" terminal settings
" au TermOpen * setlocal modifiable
autocmd TermOpen * setlocal statusline=%{b:term_title}
set autowriteall

" general terminal settings
tnoremap <special> jk <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
" " Toggle terminal on/off (neovim )
nnoremap <silent><A-t> :Ttoggle<CR>
inoremap <silent><A-t> <Esc>:Ttoggle<CR>
tnoremap <silent><A-t> <C-\><C-n>:Ttoggle<CR>

" neoterm settings
let g:neoterm_size=20
let g:neoterm_default_mod='botright'
let g:neoterm_autoinsert=1
let g:neoterm_autojump=1

" Startify shortcuts
nnoremap <A-s> :SSave 
let g:startify_session_persistence = 1

" resize windows/splits
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>
nnoremap <Up> :resize -5<CR>
nnoremap <Down> :resize +5<CR>
