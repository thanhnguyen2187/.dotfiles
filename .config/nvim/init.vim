set
\ runtimepath^=~/.vim
\ runtimepath+=~/.vim/after

let &packpath = &runtimepath
source ~/.vimrc

" Essentials
set
\ number " nu
\ relativenumber " rnu
\ scrolloff=999 " so
\ sizescrolloff=999 " siso
\ nowrap
\ nohlsearch " nohl
\ textwidth=80 " tw

" Indentation
set
\ autoindent " ai
\ smartindent " si
\ expandtab " et
\ tabsize=4 " ts
\ softtabsize=4 " sts
\ shiftwidth=4 " sw

" Tabs
" set
" \ showtabline=2

" Windows
set
\ splitbelow " sb
\ splitright " spr

" Syntax highlighting
syntax on
filetype plugin on
filetype plugin indent on

" Options to fix tmux
" set background=dark
" set t_Co=256
