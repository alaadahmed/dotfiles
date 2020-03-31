"#############################################################################"
"                *** AlaaDAhmed init.vim Configuration ***                       " 
"#############################################################################"

set nocompatible                                 " We want the latest Vim settings/options.
set path+=**
syntax on                                        " We like syntax highlights.
" set paste
set nowrap
set textwidth=120
set encoding=UTF-8                                " To allow special characters and icons.
set lazyredraw
set history=200
set mouse=a
command! MakeTags !ctags -R .

"==============================================================================
call plug#begin('~/.vim/plugged')                " You could write: `so ~/.vim/plugged.vim`

" Utilities
" ----------------------------
Plug 'scrooloose/nerdtree'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-vinegar'
Plug 'majutsushi/tagbar'                         "Browse tags of current file and its structure.
Plug 'benmills/vimux'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'gilsondev/searchtasks.vim'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'schickling/vim-bufonly'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'sbdchd/neoformat'
Plug 'chriskempson/base16-vim'


" Generic Programming Supports
" ----------------------------
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'                 "Support for tons of programming languages inside of vim.
Plug 'ludovicchabant/vim-gutentags'         "Jump to the definition of a method, class or module using Ctrl-].
Plug 'slashmili/alchemist.vim'              "It exposes module and method definitions to your fingertips.
Plug 'neomake/neomake'                      "Executes code checks to find mistakes in the currently edited file.

" Git Support
" ----------------------------
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', {'on': ['Gitv']}

" Erlang Support
" ----------------------------
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-skeletons'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'

" Elixir Support
" ----------------------------
Plug 'w0rp/ale'
Plug 'elixir-editors/vim-elixir'
Plug 'https://github.com/c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist'
Plug 'mmorearty/elixir-ctags'
Plug 'tpope/vim-endwise'


"" Elm Support
" ----------------------------
Plug 'elmcast/elm-vim'



" JavaScript ES6 Support
" ----------------------------
Plug 'isRuslan/vim-es6'

" Theme / Interface
" ----------------------------
Plug 'vim-scripts/Improved-AnsiEsc'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/badwolf'
Plug 'bling/vim-bufferline'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'junegunn/limelight.vim'
Plug 'mkarmona/colorsbox'
Plug 'romainl/Apprentice'
Plug 'Lokaltog/vim-distinguished'
Plug 'chriskempson/base16-vim'
Plug 'w0ng/vim-hybrid'
Plug 'AlessandroYorba/Sierra'
Plug 'daylerees/colour-schemes'
Plug 'effkay/argonaut.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'atelierbram/Base2Tone-vim'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'rakr/vim-one'

call plug#end()  		                 "required.
"==============================================================================


"==============================================================================
" THEMES & UI
"==============================================================================
"base16-atelier-cave
colorscheme base16-google-dark
set number
set ruler
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set laststatus=2
set t_md=

" set cursorline
set backspace=indent,eol,start                   " Make <Backspace> works as expected.
hi LineNr guibg=bg

if (has("termguicolors"))
  set termguicolors
endif

" colorscheme one
" set background=dark
hi normal guibg=bg
hi signcolumn guibg=bg

" set foldcolumn=1
" hi foldcolumn ctermbg=bg


"==============================================================================
" VARIABLES
"==============================================================================
let mapleader = ';'                            " Changing the default <Leader> from '\' to ';'
let maplocalleader = '-'

"Adding support for different language to use in Code Block in Markdown file.
let g:markdown_fenced_languages = ['html', 'ruby', 'javascript', 'elixir', 'typescript', 'elm']
let g:markdown_syntax_conceal = 0




"==============================================================================
" MAPPINGS - Generals
"==============================================================================
" Open .vimrc file in new tab for editing.
nmap <Leader>ev :tabedit $MYVIMRC<CR>

" Hightlight removal shortcut.
nmap <Leader><Space> :nohlsearch<CR>

nmap <Leader>f :tag<Space>
nmap <Leader><C-F> :Neoformat<CR>

nmap <Leader>F :FZF<CR>

" Split Management.
"----------------------------
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"==============================================================================
" AUTO COMMANDS
"==============================================================================

"We tell vim to force Markdown filetype if the extension is .md
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

augroup filetype javascript syntax=javascript

augroup autosourcing
	autocmd!
	autocmd BufWritePost init.vim source %
augroup END

autocmd BufWritePost (.*?)\.(ex|exs)$ !mix format <afile>



"==============================================================================
" SETTINGS
"==============================================================================
set hlsearch
set incsearch
set relativenumber
set noswapfile

" Split Management.
"----------------------------
set splitbelow                                   " Set Horizontal split below the current window.
set splitright                                   " Set Vertical split on the right side.




"==============================================================================
" PLUGINS CONFIGURATIONS
"==============================================================================
" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup
set laststatus=1
set showtabline=0
set noshowmode

"----------------------------
" Vim-Airline 
"----------------------------
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='one'

"----------------------------
" Vim Gutentags
"----------------------------
let g:gutentags_cache_dir = '~/.tags_cache'
set statusline+=%{gutentags#statusline()}


"----------------------------
" Alchemist Tag 
"----------------------------
let g:alchemist_tag_disable = 1

"----------------------------
" Elm config
"----------------------------
" let g:elm_format_autosave = 1


"----------------------------
" EasyAlign
"----------------------------
" Start interactive EasyAlign in Visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"----------------------------
" UltiSnips
"----------------------------
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwordTrigger='<S-Tab>'


"----------------------------
" Deoplete
"----------------------------


"----------------------------
" HardMode
"----------------------------
"HardMode to disable HJKL navigation keys and also Arrow keys.
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" nnoremap <Leader>h <Esc>:call ToggleHardMode()<CR>


"----------------------------
" Elixir-LS
"----------------------------
let g:ale_elixir_elixir_ls_release = '~/.config/nvim/bundle/elixir-ls/rel'

"----------------------------
" NERDTree
"----------------------------
nmap <C-N> :NERDTreeToggle<CR>
let NERDTreeHijackNetrw = 0


"----------------------------
" ALE Linters
"----------------------------
let g:ale_linters = {
    \    'elixir': ['elixir-ls'],
    \}
autocmd FileType javascript let g:ale_linters = findfile('.eslintrc', '.;') != '' ? {'javascript': ['eslint']} : {'javascript': ['']}

"----------------------------
" Neomake settings
"----------------------------
autocmd! BufWritePost * Neomake
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']
" When writing a buffer
call neomake#configure#automake('w')

" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)

" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000) 

"----------------------------
" Elixir Tagbar Configuration
" ---------------------------
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }


"-----------------------------
" Fzf Configuration
"-----------------------------
set rtp+=/usr/local/opt/fzf

" Mapping selecting Mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'
