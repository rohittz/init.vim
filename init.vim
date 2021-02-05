call plug#begin("~/.vim/plugged")
" Theme
Plug 'dracula/vim'
Plug 'cocopon/iceberg.vim'
" Language Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
" TypeScript Highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" File Explorer with Icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" File Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"nathanaelkane/vim-indent-guides"
Plug 'nathanaelkane/vim-indent-guides'
"starting it in startup"
let g:indent_guides_enable_on_vim_startup = 1
"kien/ctrlp.vim"
Plug 'kien/ctrlp.vim'
"vim-airline"
Plug 'vim-airline/vim-airline'
"vim-airline themes"
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
"vim-autoformat"
Plug 'Chiel92/vim-autoformat'

"limelight "
Plug 'junegunn/limelight.vim'
"emmet vim"
Plug 'mattn/emmet-vim', { 'for': 'html' }
let g:user_emmet_leader_key=','
"surround"
Plug 'tpope/vim-surround'
"setting up python2,3  and pynvim"
let g:python3_host_prog = '/usr/bin/python2' "python2
let g:python3_host_prog = '/usr/bin/python3' "python3
call plug#end()

" Enable theming support
if (has("termguicolors"))
	set termguicolors
endif

" Theme
syntax enable

colorscheme iceberg

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

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
" set nofoldenable            " don't fold by default
set foldlevel=1
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
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

" setup prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" Run Autoformat on save
:autocmd BufWritePost * Autoformat <afile>
" To choose partcular languages: edit the coc-setting.json
" error bells
set noerrorbells
" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" autosave feature : needs some 3 seconds of cursor holding to save
autocmd CursorHold,CursorHoldI * update

"setting line
set number
imap jj <ESC>
" turn terminal to normal mode with escape
tnoremap <ESC> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
	split term://bash
	resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" COC mapping
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


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
