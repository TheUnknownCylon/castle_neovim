call plug#begin()
" BEGIN OF PLUGIN SECTION

" Deoplete, for code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Denite
Plug 'Shougo/denite.nvim'

" NerdTREE
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Color scheme with _neovim_ in mind
Plug 'freeo/vim-kalisi'

" NeoFormat
Plug 'sbdchd/neoformat'

" Automatically create pairs for special chars
Plug 'jiangmiao/auto-pairs'

" Vim surround
" * ds  delete surroundings
" * ys  add surroundings, e.g. ysiw] , or yss) for a line
Plug 'tpope/vim-surround'

" openSCAD support
Plug 'sirtaj/vim-openscad'

"  Display function signatures from completions in the command line
Plug 'Shougo/echodoc.vim'

Plug 'itchyny/lightline.vim'

Plug 'neomake/neomake' | Plug 'dojoteef/neomake-autolint'

" END OF PLUGIN SECTION
call plug#end()


let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Looks
colorscheme kalisi
set t_Co=256
set background=dark

set scrolloff=9  " Keep current line centered
set relativenumber " Show relative line numbers
set number         " but on the current line show the actual line number
set title          " Set terminal title
set nowrap         " Keep it all on a line!

" Feel
let mapleader=','
set expandtab
set ts=2
set sw=2

set ignorecase
set smartcase

""""""""""""""""""""""""""""""""""""
" Navigation
""""""""""""""""""""""""""""""""""""
" Shortcut for <press shift> ; <release shift>
nnoremap ; :

" Navigation over editor lines (when in wrap)
nnoremap j gj
nnoremap k gk

" disable the arrow keys for normal cursor navigation
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"Window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nnoremap <leader>x :lclose<cr>:close<cr>


""""""""""""""""""""""""""""""""""""
" Clipboard
""""""""""""""""""""""""""""""""""""
" basic yank, paste, and delete operations on the system clipbloard
vnoremap y  "+y
nnoremap y  "+y
nnoremap yy  "+yy

nnoremap p "+p
nnoremap P "+P
vnoremap p "+p
vnoremap P "+P

vnoremap d "+d
nnoremap d "+d
vnoremap dd "+dd


""""""""""""""""""""""""""""""""""""
" NeoFormat
""""""""""""""""""""""""""""""""""""
" enable alignment on no formatter
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion on no formatter
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace on no formatter
let g:neoformat_basic_format_trim = 1

" Provide a shortcut for formatting the current buffer
nnoremap <leader>f :Neoformat<cr>

" Provide a shortcut for quick format and save
nnoremap <leader>w :Neoformat<cr>:w<cr>


""""""""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeToggle<cr>


""""""""""""""""""""""""""""""""""""
" Deoplete
""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
set completeopt+=preview

" Navigate with <C-j> and <C-k> through proposals
inoremap <expr><C-j> pumvisible() ? "\<c-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<c-p>" : "\<C-k>"

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END


""""""""""""""""""""""""""""""""""""
" echodoc
""""""""""""""""""""""""""""""""""""
set noshowmode


""""""""""""""""""""""""""""""""""""
" Denite
""""""""""""""""""""""""""""""""""""
" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '-i'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Change default prompt
call denite#custom#option('default', 'prompt', 'Yes? >')

" Let :Denite grep be interactive
call denite#custom#source('grep', 'args', ['.', '', '!'])

" Navigation commands
call denite#custom#map('insert', '<C-j>', '<C-G>')
call denite#custom#map('insert', '<C-k>', '<C-T>')

" Usage shortcuts
nnoremap <leader>g :Denite grep<cr>
nnoremap <leader>G :DeniteCursorWord grep<cr>
nnoremap <leader><leader> :Denite buffer file_rec<cr>


""""""""""""""""""""""""""""""""""""
" Language specific settings
""""""""""""""""""""""""""""""""""""
" To be moved to separate files?

" OpenSCAD
augroup OpenSCADDev
  autocmd!
  autocmd filetype openscad set expandtab ts=2 sw=2
augroup END



set hidden
