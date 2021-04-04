call plug#begin("~/.vim/plugged")
"------- Theme
Plug 'cocopon/iceberg.vim'

"------- coc/Language Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-python', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-snippets', 'coc-spell-checker']
"------ nerdTree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
"------- ALE
Plug 'dense-analysis/ale'
let g:ale_fixers = {
			\ 'javascript': ['eslint'],
			\ 'css': ['prettier'],
			\ 'html': ['prettier'],
			\ }
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '●'

"------- File Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"------- css-color
Plug 'ap/vim-css-color'

"-------nathanaelkane/vim-indent-guides
Plug 'nathanaelkane/vim-indent-guides'
" starting it in startup
let g:indent_guides_enable_on_vim_startup = 1

"-------kien/ctrlp.vim
Plug 'kien/ctrlp.vim'

"------- vim-autoformat
Plug 'Chiel92/vim-autoformat'
let g:python3_host_prog = '/usr/bin/python3' "python3
"-------vim-airline
Plug 'vim-airline/vim-airline'

"-------vim-airline themes
Plug 'vim-airline/vim-airline-themes'


"-------limelight
Plug 'junegunn/limelight.vim'

"-------emmet vim
Plug 'mattn/emmet-vim', { 'for': 'html' }
let g:user_emmet_leader_key=','

"-------surround
Plug 'tpope/vim-surround'
"------- auto-pairs
Plug 'jiangmiao/auto-pairs'

"-------setting up python2,3  and pynvim
call plug#end()

" Enable theming support
if (has("termguicolors"))
	set termguicolors
endif

" Theme
syntax enable
colorscheme iceberg

"------- NERDTree setting
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automatically close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"------- set
set nocompatible            " not compatible with vi
set autoread                " detect when a file is changed
set history=1000            " change history to 1000
set textwidth=80
set background=dark
set wrap                    " turn on line wrapping
set linebreak               " set soft wrapping
set autoindent              " automatically set indent of new line
set smartindent
set cursorline
set colorcolumn=80          " show a guideline for following 80cha rule
" Not to put new comment after a comment by default [ all files]
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" open new split panes to right and below
set splitright
set splitbelow

" setting up tab
set tabstop =4
set softtabstop =4
set shiftwidth =4

" code folding settings
set foldmethod=syntax       "fold based on indent // syntax
set foldnestmax=10          " deepest fold is 10 levels

"set autoindent
set autoindent
set ttyfast                 " faster redrawing
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

"setting for coc-snippets
noremap <silent><expr> <TAB>
			\ pumvisible() ? coc#_select_confirm() :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" To choose partcular languages: edit the coc-setting.json

" autosave feature : needs some 3 seconds of cursor holding to save
autocmd CursorHold,CursorHoldI * update


" start terminal in insert mode
:au BufEnter * if &buftype == 'terminal' | :startinsert | endif

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
au BufWrite * :Autoformat

""""""""""nerdtree mapping
" toggle nerdtree
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

""""""""""fzf mapping
" open fzf
nnoremap <C-p> :FZF<CR>

" open selected file in tab split, split or vsplit
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}

""""""""""folding mapping
" set nofoldenable
" don't fold by default
set foldlevel=1
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

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
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

"setting keymap to refresh init.vim
nnoremap <leader>sv :source $MYVIMRC<CR>
" integrating clang-format in vim
function! Formatonsave()
	let l:formatdiff = 1
	pyf ~/llvm/tools/clang/tools/clang-format/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

