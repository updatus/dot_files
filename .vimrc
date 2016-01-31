set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/vundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'wellsjo/wellsokai.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'danro/rename.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-commentary'
Plugin 'morhetz/gruvbox'
call vundle#end()
filetype plugin indent on

" Settings {{{
syntax on
set number
set hidden
set list
set listchars=tab:▸\ ,trail:¬,extends:❯,precedes:❮
set showbreak=↪
set scrolloff=10
set backspace=indent,eol,start        " backspace in insert mode
set tabstop=2                         " (ts) width (in spaces) that a <tab> is displayed as
set expandtab                         " (et) expand tabs to spaces (use :retab to redo entire file)
set shiftwidth=2                      " (sw) width (in spaces) used in each step of autoindent (aswell as << and >>)set ruler
set clipboard=unnamed
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" This should make drawing the window 9000 times faster
set ttyfast
set lazyredraw
set regexpengine=2
" More frequent updates for, e.g. signs.
set updatetime=800
" Update syntax highlighting for more lines increased scrolling performance
syntax sync minlines=256
" Don't syntax highlight long lines
set synmaxcol=256
" Theme settings
" Set terminal colors to 256
let g:gruvbox_termcolors=16
colorscheme gruvbox
set t_Co=256
set background=dark

"let mapleader=","

let mapleader = "\<Space>"
" Mappings {{
nnoremap <leader>q :q<cr>
noremap  <leader>s <esc>:w<CR>
inoremap <leader>s <esc>:w<CR>

nmap <silent> <C-DOWN> <C-f>
nmap <silent> <C-UP>   <C-b>

nmap <leader>w viw
nmap <leader>v 0v$h
nmap <leader>c gcc<CR>
vmap <leader>c gc<CR>
" Remap ctrl + p to ,d
let g:ctrlp_map = '<C-p>'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()':      ['<c-r>'],
  \ }

"Keybinding for NERDTree Plugin
nnoremap <leader>t :NERDTree<CR>

"Keybinding for Ag plugin 
nmap <S-f> :Ag<space>
let g:ag_highlight=1

"Tab keys map
nnoremap <leader>p :tabprevious<CR>
nnoremap <leader>n :tabnext<CR>

"Keybinding for incsearch plugin 
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Two spaces with >> for ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Remap split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_
noremap j gj
noremap k gk

if &term =~ '^screen'
	    " tmux will send xterm-style keys when xterm-keys is on
	    execute "set <xUp>=\e[1;*A"
	    execute "set <xDown>=\e[1;*B"
	    execute "set <xRight>=\e[1;*C"
	    execute "set <xLeft>=\e[1;*D"
endif
