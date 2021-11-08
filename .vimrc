" Essentials
set number " nu
set relativenumber " rnu
set scrolloff=999 " so
" set sidescrolloff=999 " siso
set nowrap
set nohlsearch " nohl
set textwidth=80 " tw
set colorcolumn=80 " cc
highlight ColorColumn ctermbg=238
" nmap <Enter> o<Esc>k

" Indentation
set autoindent " ai
set smartindent " si
set expandtab " et
set tabstop=4 " ts
set softtabstop=4 " sts
set shiftwidth=4 " sw

" Tabs
" set showtabline=2

" Windows
set splitbelow " sb
set splitright " spr

" Syntax highlighting
syntax on
filetype plugin on
filetype plugin indent on

" Options to fix tmux
" set background=dark
" set t_Co=256
nmap <F3> i<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>

" Custom functions and commands
function! s:setClipboard()
    set clipboard=unnamedplus
endfunction

function! s:unsetClipboard()
    set clipboard=unnamed
endfunction

command! SetClipboard :call s:setClipboard()
command! UnsetClipboard :call s:unsetClipboard()
