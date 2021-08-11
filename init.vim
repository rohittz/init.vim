"------- Plugin manager : Vim plug
call plug#begin("~/.vim/plugged")

"------- Theme(NeoSolarized)
Plug 'overcache/NeoSolarized'
let g:neosolarized_contrast = "high"
let g:neosolarized_vertSplitBgTrans = 1

"------ Theme(Nord-vim)
Plug 'arcticicestudio/nord-vim'


"------- coc/Language Client(intellisense engine for VIM)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-python','coc-css','coc-html', 'coc-json', 'coc-tsserver', 'coc-snippets', 'coc-spell-checker']

"------ nerdTree(File explorer)
Plug 'scrooloose/nerdtree'

"------ Devicons
Plug 'ryanoasis/vim-devicons'

"------- ALE(Linting plugin to show syntax/structure errors)
Plug 'dense-analysis/ale'
let g:ale_fixers = {
			\ 'javascript': ['eslint'],
			\ 'css': ['prettier'],
			\ 'html': ['prettier'],
			\ }
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '●'

"------- File Search(For searching file on the current terminal directory)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"------- css-color(highlighting each CSS color)
Plug 'ap/vim-css-color'

"------- vim indent guides(Showing indent guides using particular characters)
Plug 'Yggdroot/indentLine'

let g:indentLine_fileTypeExclude = ["vimwiki", "coc-explorer", "help", "undotree", "diff"]
let g:indentLine_bufTypeExclude = ["help", "terminal"]
let g:indentLine_indentLevel = 10

" Conceal settings
let g:indentLine_setConceal = 1
let g:indentLine_concealcursor = "incv"
let g:indentLine_conceallevel = 2

let g:indentLine_char = '|'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Leading Space
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = "•"

" Use Theme Colors
"let g:indentLine_setColors = 0

" 16 Color
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" 256
let g:indentLine_color_term = 239

" True Color
let g:indentLine_color_gui = '#57696B'

"------- vim-autoformat
Plug 'Chiel92/vim-autoformat'
let g:python3_host_prog = '/usr/bin/python3' "python3
let g:python2_host_prog = '/usr/bin/python2' "python2

"-------vim-airline
Plug 'vim-airline/vim-airline'

"-------vim-airline themes
Plug 'vim-airline/vim-airline-themes'


"-------limelight
Plug 'junegunn/limelight.vim'


"-------surround
Plug 'tpope/vim-surround'
"------- auto-pairs
Plug 'jiangmiao/auto-pairs'

" ------vimtex
Plug 'lervag/vimtex'
let g:tex_flavor = 'latex'
" let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode=0 
"set conceallevel=1
"let g:tex_conceal='abdmg'
" -----ultisnips
Plug 'sirver/ultisnips'
  let g:UltiSnipsExpandTrigger = "<nop>"
  let g:UltiSnipsJumpForwardTrigger = "<c-j>"
  let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
  let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/vim/UltiSnips']
  let g:UltiSnipsRemoveSelectModeMappings = 0
   let g:UltiSnipsEnableSnipMate = 0

  " nnoremap <leader>es :UltiSnipsEdit!<cr>
" ---- Vim snippets
  Plug 'honza/vim-snippets'

"-------setting up python2,3  and pynvim
call plug#end()

" Enable theming support
if (has("termguicolors"))
	set termguicolors
endif

" Theme
syntax on
set background=dark

colorscheme NeoSolarized

"------- NERDTree setting
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automatically close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"------- set
" setting hubrid line number

set nocompatible
set notermguicolors
set t_Co=256
set number relativenumber
set nu rnu
set autoread                " detect when a file is changed
set history=1000            " change history to 1000
set textwidth=80
set background=dark
set wrap                    " turn on line wrapping
set linebreak               " set soft wrapping
set autoindent              " automatically set indent of new line set smartindent
set showcmd
set smartindent
set cursorline
set showmatch "highlight matching brackets"
set colorcolumn=80          " show a guideline for following 80cha rule
" Not to put new comment after a comment by default [ all files]
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" open new split panes to right and below
set splitright
set splitbelow

" setting up tab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" code folding settings
set foldmethod=syntax       "fold based on indent // syntax
set foldnestmax=10          " deepest fold is 10 levels

"set autoindent
set autoindent
set diffopt+=vertical
set wildmenu                " enhanced command line completion

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers

" error bells
set noerrorbells

"setting line
set number

"setlocal indentkeys-=:

"setting for coc-snippets
" noremap <silent><expr> <TAB>
			" \ pumvisible() ? coc#_select_confirm() :
			" \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
			"\ <SID>check_back_space() ? "\<TAB>" :
			"\ coc#refresh()

" function! s:check_back_space() abort
	" let col = col('.') - 1
	" return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<c-j>'


" To choose partcular languages: edit the coc-setting.json

" autosave feature : needs some 3 seconds of cursor holding to save
autocmd CursorHold,CursorHoldI * update


" start terminal in insert mode
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

" uses zsh instead of bash
function! OpenTerminal()
	split term://bash
	resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"------- coc setting
" if hidden is not set, TextEdit might fail
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"-_-_-_-_-_-_-_-_-_-_-_-_-_-_ overwrite mapping or new mapping
" formatting on save
"autocmd BufWrite *.c :AutoFormat
" auto comment
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

""""""""""nerdtree mapping
" toggle nerdtree
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

""""""""""fzf mapping
" open fzf
nnoremap <C-p> :FZF<CR>

" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'



" open selected file in tab split, split or vsplit
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}

""""""""""folding mapping
" set nofoldenable
" don't fold by default
"set foldlevel=1
"inoremap <F9> <C-O>za
"nnoremap <F9> za
"onoremap <F9> <C-C>za
"vnoremap <F9> zf

""""""""""scrolling the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

""""""""""switch to normal mode with jj
imap jj <ESC>

""""""""""use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

""""""""""esc to go to normal mode in terminal
tnoremap <ESC> <C-\><C-n>

""""""""""go to the next line[oo], but not switch to insert mode
""""" This is making neovim slow, as it waiting for next input to check if this is o,
"nmap oo o<Esc>k

""""""""""coc mapping
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
			" \ pumvisible() ? "\<C-n>" :
			" \ <SID>check_back_space() ? "\<TAB>" :
			" \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" select whole content using ctrl-a
map <C-a> <esc>ggVG<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
