"nmap <silent> <RIGHT>         :cnext<CR>
"nmap <silent> <LEFT>          :cprev<CR>
"nmap <silent> <RIGHT><RIGHT>  :cnfile<CR><C-G>
"nmap <silent> <LEFT><LEFT>    :cpfile<CR><C-G>

"Only apply to .txt files...
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

set ruler
set hidden
execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme wellsokai

set clipboard=unnamed

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'



