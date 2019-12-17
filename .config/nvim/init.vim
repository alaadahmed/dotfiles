"#############################################################################"
"                *** AlaaDAhmed init.vim Configuration ***                       " 
"#############################################################################"

set nocompatible                                 " We want the latest Vim settings/options.
set path+=**
syntax on                                        " We like syntax highlights.
set pastetoggle=<F5>
set nowrap
set textwidth=120
set encoding=UTF-8                                " To allow special characters and icons.
set lazyredraw
set history=200
set mouse=a

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=1000
set shortmess+=c
set signcolumn=yes
set viewoptions=folds,cursor
set sessionoptions=folds

command! MakeTags !ctags -R .

"==============================================================================
call plug#begin('~/.config/nvim/bundle')                " You could write: `so ~/.vim/plugged.vim`

" Utilities
" ----------------------------
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
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
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'ervandew/supertab'
Plug 'schickling/vim-bufonly'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'sbdchd/neoformat'
Plug 'chriskempson/base16-vim'
Plug 'psliwka/vim-smoothie'                     " Smooth scrolling for vim done right

" Generic Programming Supports
" ----------------------------
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'                 "Support for tons of programming languages inside of vim.
Plug 'ludovicchabant/vim-gutentags'         "Jump to the definition of a method, class or module using Ctrl-].
" Plug 'slashmili/alchemist.vim'              "It exposes module and method definitions to your fingertips.
Plug 'neomake/neomake'                      "Executes code checks to find mistakes in the currently edited file.
" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
Plug 'elmcast/elm-vim', {'for': 'elm'}
" Plug 'pbogut/deoplete-elm'



" JavaScript ES6 Support
" ----------------------------
Plug 'isRuslan/vim-es6'

" React Support
" ----------------------------
Plug 'mxw/vim-jsx'


"" Theme / Interface
" ----------------------------
Plug 'vim-scripts/Improved-AnsiEsc'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/badwolf'
Plug 'bling/vim-bufferline'
Plug 'mkarmona/colorsbox'
Plug 'romainl/Apprentice'
Plug 'Lokaltog/vim-distinguished'
Plug 'chriskempson/base16-vim'
Plug 'w0ng/vim-hybrid'
Plug 'daylerees/colour-schemes'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'rakr/vim-one'

call plug#end()  		                 "required.
"==============================================================================


"==============================================================================
" THEMES & UI
"==============================================================================
colorscheme base16-google-dark
set number
set ruler
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set laststatus=2
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

" Coc Mapping
"---------------------------
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()['selected'] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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

" augroup AutoSaveFolds
"   autocmd!
"   " view files are about 500 bytes
"   " bufleave but not bufwinleave captures closing 2nd tab
"   " nested is needed by bufwrite* (if triggered via other autocmd)
"   autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
"   autocmd BufWinEnter ?* silent! loadview
" augroup END


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
" LanguageClient-neovim
"----------------------------
" let g:LanguageClient_serverCommands = {
"     \ 'elixir': ['~/.elixir-ls/release/language_server.sh'],
"     \ 'elm': ['/usr/local/bin/elm-language-server'],
"     \}
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


"----------------------------
" Neoformat
"----------------------------
let g:neoformat_try_formatprg=1

augroup NeoformatAutoFormat
  autocmd!
  autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\
                                                          \--stdin\
                                                          \--print-width\ 80\
                                                          \--single-quote\
                                                          \--trailing-comma\ es5
  autocmd BufWritePre *.js,*.jsx Neoformat
augroup END

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
" let g:deoplete#enable_at_startup = 1


"----------------------------
" HardMode
"----------------------------
"HardMode to disable HJKL navigation keys and also Arrow keys.
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" nnoremap <Leader>h <Esc>:call ToggleHardMode()<CR>


"----------------------------
" Elixir-LS
"----------------------------
" let g:ale_elixir_elixir_ls_release = '~/.config/nvim/bundle/elixir-ls/rel'

"----------------------------
" NERDTree
"----------------------------
nmap <C-N> :NERDTreeToggle<CR>
let NERDTreeHijackNetrw = 0


"----------------------------
" ALE Linters
"----------------------------
" let g:ale_linters = {
"     \    'elixir': ['elixir-ls'],
"     \}
" autocmd FileType javascript let g:ale_linters = findfile('.eslintrc', '.;') != '' ? {'javascript': ['eslint']} : {'javascript': ['']}

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
