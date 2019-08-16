"
" Thanks to Taldrain and SkypLabs
"

" =============================================================================
" PLUGINS
" =============================================================================
call plug#begin('~/.vim/plugged')

" commentary
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

"Linting"
Plug 'w0rp/aleo'

Plug 'udalov/kotlin-vim'
" surround
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" goyo.vim
" https://github.com/junegunn/goyo.vim
Plug 'junegunn/goyo.vim'

" limelight.vim
" https://github.com/junegunn/limelight.vim
Plug 'junegunn/limelight.vim'

" fzf.vim
" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" =============================================================================
" PLUGIN CONFIG
" =============================================================================
function! s:goyo_enter()
  set nonumber
  set noshowmode
  set noshowcmd
  set cc=
endfunction

function! s:goyo_leave()
  set number
  set cc=80
  set showmode
  set showcmd
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" =============================================================================
" SYNTAX
" =============================================================================
syntax on
set background=dark
colorscheme delek

" =============================================================================
" OPTION
" =============================================================================
" Enable syntax highlighting.
syntax enable

" Eclim settings
set nocompatible
filetype plugin indent on

" Display line numbers.
" http://vim.wikia.com/wiki/Display_line_numbers
set nu

" Highlight current line.
" http://vim.wikia.com/wiki/Highlight_current_line
set cursorline

" Highlight matching braces.
" http://vim.wikia.com/wiki/Moving_to_matching_braces
set showmatch

" Enable the mouse.
set mouse=a

" Indentation settings.
" http://vim.wikia.com/wiki/Indenting_source_code
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
filetype indent plugin on

" Scroll when the cursor gets within 3 characters of top/bottom edge
" http://vim.wikia.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen
set scrolloff=3

" Searching settings.
" http://vim.wikia.com/wiki/Searching
set incsearch
set ignorecase
set smartcase
set hlsearch!

" Enable command-line completion.
" http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse
set wildmenu
set wildmode=list:longest,list:full
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz,*.pyc

" Show incomplete commands
" https://www.hscripts.com/tutorials/vim-commands/showcmd.html
set showcmd

" Enable spell checking.
" https://www.linux.com/learn/using-spell-checking-vim
set spelllang=en,fr
set spell
set spellsuggest=5

" Set UTF-8 as standard encoding
" http://vim.wikia.com/wiki/Working_with_Unicode
set encoding=utf-8

" Set UNIX as the standard file type
" http://vim.wikia.com/wiki/File_Format
set ffs=unix,dos,mac

let mapleader = ','

" Switch between Vim window splits easily.
" http://vim.wikia.com/wiki/Switch_between_Vim_window_splits_easily
set wmh=0
set wh=999
nnoremap <Space> <C-w>
nnoremap <Space><Space> <C-w>w
nmap <silent> <C-H> :wincmd h<CR>
nmap <silent> <C-L> :wincmd l<CR>
map <leader>l :Limelight!! <CR>
map <leader>g :Goyo <CR>

" Toggle the Tagbar window when pressing <F8>.
nmap <F8> :TagbarToggle<CR>

" fzf
map <leader>b :Buffers<CR>
map <leader>f :Files<CR>

" Remove automatically all trailing whitespace
" when saving.
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * %s/\s\+$//e

" Enable as-you-type completion using YouCompleteMe.
" https://github.com/Microsoft/TypeScript/wiki/TypeScript-Editor-Support#vim
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" YCM will auto-close the 'preview' window after leaving insert mode.
" https://github.com/Valloric/YouCompleteMe#the-gycm_autoclose_preview_window_after_insertion-option.
let g:ycm_autoclose_preview_window_after_insertion = 1
