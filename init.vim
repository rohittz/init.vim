"------- Plugin manager : Vim plug
call plug#begin("~/.vim/plugged")

"------- Theme(NeoSolarized)
 Plug 'overcache/NeoSolarized'
    let g:neosolarized_contrast = "high"
    let g:neosolarized_vertSplitBgTrans = 1

"------- coc/Language Client(intellisense engine for VIM)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-snippets', 'coc-spell-checker']

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
    let g:indentLine_concealcursor=''
    let g:indentLine_conceallevel = 1
    let g:indentLine_fileTypeExclude = ['tex', 'markdown']

    let g:indentLine_char = '|'
    "let g:indentLine_char_list = ['|', '¦', '┆', '┊']

        " Leading Space
    let g:indentLine_leadingSpaceEnabled = 1
    let g:indentLine_leadingSpaceChar = "•"


    " 16 Color
    let g:indentLine_color_tty_light = 7 " (default: 4)
    let g:indentLine_color_dark = 1 " (default: 2)

    " 256
    let g:indentLine_color_term = 239

    " True Color
    let g:indentLine_color_gui = '#57696B'

"-------vim-airline
Plug 'vim-airline/vim-airline'

"-------vim-airline themes
Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='base16'

"-------limelight
Plug 'junegunn/limelight.vim'
    let g:limelight_conceal_ctermfg = 240

"-------surround
Plug 'tpope/vim-surround'

"------- auto-pairs
Plug 'jiangmiao/auto-pairs'

" ------vimtex
Plug 'lervag/vimtex'
    let g:tex_flavor = 'latex'
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_quickfix_mode=0 
    set conceallevel=1
    " set conceallevel=1
    let g:tex_conceal='abdmg'

" -----ultisnips
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = "<nop>"
    let g:UltiSnipsJumpForwardTrigger = "<c-j>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
    let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/vim/UltiSnips']
    let g:UltiSnipsRemoveSelectModeMappings = 0
    let g:UltiSnipsEnableSnipMate = 0

" ---- Vim snippets
Plug 'honza/vim-snippets'

"-------setting up python2,3  and pynvim
call plug#end()

" Enable theming support
if (has("termguicolors"))
	set termguicolors
endif

" Theme
    set background=dark
    syntax on
    colorscheme NeoSolarized

"------- NERDTree setting
    let g:NERDTreeShowHidden = 1
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeIgnore = []
    let g:NERDTreeStatusline = ''
        " Automatically close nvim if NERDTree is only thing left open
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"------- set
setlocal spell
set spelllang=en_us
inoremap <C-i> <C-g>u<Esc>[s1z=`]a<C-g>u
set nocompatible
"----- Chnaging colors to adapt with 16 colors
    set notermguicolors
    set t_Co=256
"----- Hybrid line number
    set number relativenumber
    set nu rnu
set autoread                " detect when a file is changed
set history=1000            " change history to 1000
set textwidth=80
set wrap                    " turn on line wrapping
set linebreak               " set soft wrapping
set autoindent              " automatically set indent of new line set smartindent
set smartindent
set showcmd
set cursorline              " Highlighting the current line
set showmatch               "highlight matching brackets"
"---- It would overflowed text in red
     match ErrorMsg '\%>80v.\+'  
"---- Not to put new comment after a comment by default [ all files]
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" open new split panes to right and below
    set splitright
    set splitbelow

" setting up tab
    set expandtab               "Converting tabs into space
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4            "Autoindent follow this

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


" autosave feature : needs some 3 seconds of cursor holding to save
    autocmd CursorHold,CursorHoldI * update


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
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


"---- toggle nerdtree
    nnoremap <silent> <C-b> :NERDTreeToggle<CR>

"---- fzf setting
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

"---- scrolling the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"---- switch to normal mode with jj
imap jj <ESC>


""""""""""coc mapping
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

"---- Coc snippet mapping
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"--- testing
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

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
" Inkscape set up with vimtex
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

