""""""""""""
" Vim Plug "
""""""""""""

call plug#begin('~/.vim/bundle')

    """""""""""""""""""
    " Auto Completion "
    """""""""""""""""""
    " Plug 'Valloric/YouCompleteMe'
    "     nnoremap <leader>gg :YcmCompleter GoTo<CR>
    "     nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
    "     nnoremap <leader>rr :YcmCompleter RefactorRename
    "     nnoremap <leader>rf :YcmCompleter Format<CR>
    "     let g:ycm_autoclose_preview_window_after_completion=1
    "     let g:ycm_python_binary_path='python3'
    " Plug 'vim-syntastic/syntastic'
    Plug 'Shougo/deoplete.nvim'
        let g:deoplete#enable_at_startup=1
        let g:python3_host_prog="/usr/bin/python3"

        if !has('nvim')
            Plug 'roxma/nvim-yarp'
            Plug 'roxma/vim-hug-neovim-rpc'
        endif
    Plug 'dense-analysis/ale'
        " let g:ale_linter={
        " \    'rust': ['analyzer']
        " \}
    " Plug 'sheerun/vim-polyglot'
    " Plug 'xolox/vim-session'
    " Plug 'kevinhwang91/vim-ibus-sw'

    """""""""""""""""""
    " File Navigation "
    """""""""""""""""""
    Plug 'vim-airline/vim-airline'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'
    Plug 'vim-airline/vim-airline-themes'
        let g:airline_theme='distinguished'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mkitt/tabline.vim'
    Plug 'mhinz/vim-startify'
    " Plug 'tpope/vim-vinegar'
        " let g:netrw_bufsettings="noma nomod nu nobl nowrap ro rnu"
        " let g:netrw_liststyle=3
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-fugitive'
    " Plug 'preservim/nerdtree'
    "     let NERDTreeShowLineNumbers=1
    "     autocmd FileType nerdtree setlocal relativenumber
    "     autocmd vimenter * NERDTree
    " Plug 'scrooloose/nerdtree-project-plugin'
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
        autocmd vimenter * CHADopen --nofocus
        let g:chadtree_settings={
            \'view.width': 28,
        \}
    Plug 'ryanoasis/vim-devicons'
    Plug 'Yggdroot/indentLine'
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']

    """""""""""""""""
    " Code Editting "
    """""""""""""""""
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'Chiel92/vim-autoformat'
    Plug 'FooSoft/vim-argwrap'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/vim-easy-align'
        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tommcdo/vim-exchange'

    " Python
    " Plug 'deoplete-plugins/deoplete-jedi'
    " Plug 'davidhalter/jedi-vim'
    "     let g:jedi#completions_enabled = 0
    " Plug 'vim-scripts/indentpython.vim'
    " Plug 'vim-python/python-syntax'
    "     let python_highlight_all=1
    " Plug 'numirias/semshi', { 'do': { -> fzf#install() } }
    " Plug 'nvie/vim-flake8'

    " Javascript
    " Plug 'pangloss/vim-javascript'

    " HTML, CSS
    Plug 'mattn/emmet-vim'

    " JSON, YML, TOML
    Plug 'cespare/vim-toml'
    Plug 'pedrohdz/vim-yaml-folds'
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Rust
    Plug 'rust-lang/rust.vim'

    " Markdown
    " Plug 'godlygeek/tabular'
    " Plug 'plasticboy/vim-markdown'
    "     let g:vim_markdown_frontmatter = 1
    "     let g:vim_markdown_toml_frontmatter = 1
    "     let g:vim_markdown_json_frontmatter = 1
    "     let g:vim_markdown_strikethrough = 1
    Plug 'SidOfc/mkdx'
    " Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
    "     let g:instant_markdown_logfile = '/tmp/instant_markdown.log'

    " Racket
    Plug 'wlangstroth/vim-racket'
    if has("autocmd")
        au BufReadPost *.rkt,*.rktl set filetype=racket
        au filetype racket set lisp
        " au filetype racket set autoindent
    endif

    " Just
    Plug 'NoahTheDuke/vim-just'

    " Other fixes
    " Plug 'dkarter/bullets.vim'
    " Plug 'unblevable/quick-scope'
    " Plug 'rlue/vim-barbaric'
    "     let g:barbaric_ime = 'ibus'
    " Plug 'vimwiki/vimwiki'
    " Plug 'vimoutliner/vimoutliner'

    " Asciidoc
    Plug 'habamax/vim-asciidoctor'
    fun! AsciidoctorMappings()
        nnoremap <buffer> <leader>oo :AsciidoctorOpenRAW<CR>
        " nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
        " nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
        " nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
        " nnoremap <buffer> <leader>ch :Asciidoctor2HTML<CR>
        " nnoremap <buffer> <leader>cp :Asciidoctor2PDF<CR>
        " nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
        nnoremap <buffer> <leader>ap :AsciidoctorPasteImage<CR>
        " :make will build pdfs
        " compiler asciidoctor2pdf
        let g:asciidoctor_img_paste_command = 'xclip -selection clipboard -t image/png -o > %s%s'
        let g:asciidoctor_img_paste_pattern = 'img_%s_%s.png'
    endfun

    " Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
    augroup asciidoctor
        au!
        au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
    augroup END

    " todo.txt
    Plug 'freitass/todo.txt-vim'


call plug#end()

""""""""""""
" Personal "
""""""""""""

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
