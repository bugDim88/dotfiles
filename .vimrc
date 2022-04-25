" plugins settings (vim-plug tool is used)
call plug#begin('~/.vim/plugged')
Plug 'mileszs/ack.vim'
Plug 'yanqd0/android-log.vim'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" NERDTree
Plug 'preservim/nerdtree'
"Plug 'preservim/nerdcommenter'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'tpope/vim-fugitive'
Plug 'jcherven/jummidark.vim'
Plug 'udalov/kotlin-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/textutil.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'mhinz/vim-janah'
Plug 'mtdl9/vim-log-highlighting'
Plug 'mhinz/vim-startify'

Plug 'vimwiki/vimwiki'

Plug 'NLKNguyen/papercolor-theme'

"# icons must be the last one
"Plug 'ryanoasis/vim-devicons'

call plug#end()

"#################################
"# vimwiki settings              #  
"#################################
"# set paht for index
let g:vimwiki_list = [{'path': '$HOME/Dropbox/wiki'}]
"# set extension to .md
let g:vimwiki_ext = '.md' 
"# make sure vimwiki doesn't own all .md files
let g:vimwiki_global_ext = 0 
"# folding method
let g:vimwiki_folding='list'
"# workaround on diary update
autocmd BufEnter diary.md :VimwikiDiaryGenerateLinks

"#################################
"# settings for local vimrc      #  
"#################################
set exrc
set secure exrc

"#################################
"# lines to cursor highlight     #  
"#################################
set cursorline
set cursorcolumn

set backspace=indent,eol,start
set autoindent
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"# remap $MYVIMRC
let $MYVIMRC="~/dotfiles/.vimrc"

"#################################
"# line number settings          #  
"#################################
set relativenumber
set number

"#################################
"# encoding settings             #  
"#################################
set encoding=UTF-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

"#################################
"# case insesetive search        #  
"#################################
set ignorecase

"# Ex history
set history=200

"#################################
"# syntax hightlight             #  
"#################################
"# syntax highlight
syntax on
"# android log syntax hight light
set ft=android_log

"#################################
"# lines to save text folding    #  
"#################################
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"# easy expansion of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


"# copy to clipboard
set clipboard=unnamed

"# octal numbers skiped
set nrformats=

"#################################
"# tab identation                #  
"#################################
set shiftwidth=4
set softtabstop=4
set expandtab

" tab completion
set wildmenu
set wildmode=full

set nowrapscan

"##########################
"# color settings         #
"##########################
colorscheme PaperColor
set background=dark

"##########################
"# fzf settings           #
"##########################
set rtp+=/usr/local/opt/fzf
let g:fzf_preview_window = ['up:40%', 'ctrl-\']

"# for powerline bottom bar
set laststatus=2

"##########################
"# default font           #
"##########################
set guifont=Hack_Nerd_Font_Mono


"##########################
"##########################
"# MAPPINGS               #
"##########################
"##########################


"##########################
"# set leader key         #
"##########################
nnoremap <SPACE> <Nop>
let mapleader="\<SPACE>"

"##########################
"# map arrow keys         #
"##########################
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

"##########################
"# search next and center #
"##########################
noremap <Leader>n nzz
noremap <Leader>N Nzz

"######################################
"# count last serch pattern accurence #
"######################################
noremap <Leader>sc :%s///gn<CR>

"#################################
"# edit vimrc                    #  
"#################################
:nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
:nnoremap <Leader>sv :source $MYVIMRC<CR>

"#################################
"# past yank register content    #  
"#################################
::nnoremap <Leader>p "0p

"#################################
"# window resize                 #  
"#################################
nnoremap <Leader>l :exe "vertical resize +5"<CR>
nnoremap <Leader>h :exe "vertical resize -5"<CR>
nnoremap <Leader>k :exe "resize +5"<CR>
nnoremap <Leader>j :exe "resize -5"<CR>

"#################################
"# tab navigation                #  
"#################################
nnoremap <Leader>[ gT
nnoremap <Leader>] gt

"#################################
"# tab moving                    #  
"#################################
nnoremap t[ :exe "tabm -"<CR>
nnoremap t] :exe "tabm +"<CR> 

"#################################
"# close buffer                  #  
"#################################
nnoremap <Leader>q :q<CR>

"#################################
"# split navigation with alt key #  
"#################################
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

"####################################
"# pretty json of current row       #  
"####################################
nnoremap js :exe "'<,'>!jq"<CR>

"####################################
"# toggle background (light || dark)#  
"####################################
nnoremap cb :let &bg=(&bg=='light'?'dark':'light')<CR>

"#################################
"# NerdTree                      #  
"#################################
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap ftf :NERDTreeFind<CR>
"# show hidden files
let NERDTreeShowHidden=1

"#################################
"# Fugitive map                  #  
"#################################
nnoremap <leader>g :Git<CR>
nnoremap <leader>gl :Gclog<CR>
