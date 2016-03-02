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
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-commentary'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-rvm'
Plugin 'ervandew/supertab'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'vim-airline/vim-airline'
Plugin 'dkprice/vim-easygrep'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'xolox/vim-easytags'
call vundle#end()

filetype plugin indent on
autocmd FileType ruby compiler ruby
set omnifunc=syntaxcomplete#Complete
" Settings {{{
syntax on
" Color Theme settings
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark="hard"
" Set terminal colors to 256
" let g:gruvbox_termcolors=16
" set t_Co=256

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
set clipboard=unnamed                 " copy paste to system clipboard
set ignorecase                        " Use case insensitive search, except when using capital letters
set smartcase
set ttyfast                           " This should make drawing the window 9000 times faster
set lazyredraw
set regexpengine=2
set updatetime=800                    " More frequent updates for, e.g. signs.
syntax sync minlines=256              " Update syntax highlighting for more lines increased scrolling performance
set synmaxcol=256                     " Don't syntax highlight long lines
set timeoutlen=1000 ttimeoutlen=0     " Eliminating delays on ESC
set cursorline
set showcmd                           " Show (partial) command in status line
set showmatch                         " Show matching brackets
set ruler                             " Show the line and column number
set esckeys                           " Cursor keys in insert mode
set nojoinspaces

let mapleader=","
" Mappings {{
" Use ; for commands.
nnoremap ; :
nnoremap <leader>q :q<cr>
noremap  <leader>s <esc>:w<CR>
inoremap <leader>s <esc>:w<CR>
nnoremap P P<Right>
nnoremap p p<Right>
vnoremap jj <Esc>
inoremap jj <Esc><Right>
" nmap <leader>w viw
" nmap <leader>v 0v$h

" tpope comments
nmap <leader>c gcc<CR>
vmap <leader>c gc<CR>

" tpope surroud
nmap <leader>' ysiw'
nmap <leader>" ysiw"

" Ctrl a - select all
map <C-a> <esc>ggVG<CR>

" Remap ctrl + p to ,d
" let g:ctrlp_map = '<leader>d'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()':      ['<c-r>'],
  \ }

"Keybinding for NERDTree Plugin
nnoremap <leader>t :NERDTree<CR>

"Keybinding for Ag plugin 
nmap <S-f> :Ag<space>""<left>
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
nnoremap <C-down> <C-W><C-J>
nnoremap <C-up> <C-W><C-K>
nnoremap <C-right> <C-W><C-L>
nnoremap <C-left> <C-W><C-H>

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_
noremap j gj
noremap k gk

" Onmi Complete
inoremap <C-b> <C-x><C-o>

" Move lines
nnoremap <A-Down> :m .+1<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Auto redraw
" au FocusGained * :redraw!

if &term =~ '^screen'
	    " tmux will send xterm-style keys when xterm-keys is on
	    execute "set <xUp>=\e[1;*A"
	    execute "set <xDown>=\e[1;*B"
	    execute "set <xRight>=\e[1;*C"
	    execute "set <xLeft>=\e[1;*D"
endif
" vim could not recognized rvm ruby version - https://rvm.io/integration/vim
set shell=/bin/sh

" rcodetooll xmpfilter
" autocmd FileType ruby nmap <buffer> <leader>m <Plug>(xmpfilter-mark)
" autocmd FileType ruby xmap <buffer> <leader>m <Plug>(xmpfilter-mark)
" autocmd FileType ruby imap <buffer> <leader>m<Plug>(xmpfilter-mark)

" autocmd FileType ruby nmap <buffer> <leader>r <Plug>(xmpfilter-run)
" autocmd FileType ruby xmap <buffer> <leader>r <Plug>(xmpfilter-run)
" autocmd FileType ruby imap <buffer> <leader>r <Plug>(xmpfilter-run)

" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_left_sep='>'
" set noshowmode

" quick fix autoheight window
au FileType qf call AdjustWindowHeight(3, 25)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Make :help appear in a full-screen tab, instead of a window
" Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

" Disable beep and visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

