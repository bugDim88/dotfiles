set backspace=indent,eol,start
set autoindent
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"remap $MYVIMRC
let $MYVIMRC="~/dotfiles/.vimrc"

"line number settings
set relativenumber
set number

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

set ignorecase

" Ex history
set history=200

"xkbswitch
"let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
"let g:XkbSwitchEnabled = 1
"let g:XkbSwitchIMappings = ['ru']

" android log syntax hight light
set ft=android_log

" easy expansion of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" syntax highlight
syntax on

" copy to clipboard
set clipboard=unnamed

" octal numbers skiped
set nrformats=

" tab identation
set shiftwidth=4
set softtabstop=4
set expandtab

" tab completion
set wildmenu
set wildmode=full

set nowrapscan

colorscheme janah
set background=dark

set rtp+=/usr/local/opt/fzf

" for powerline bottom bar
set laststatus=2

let g:fzf_preview_window = ['up:40%', 'ctrl-\']

" MAPS
"


" set leader key
nnoremap <SPACE> <Nop>
let mapleader="\<SPACE>"

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

noremap <Leader>n nzz
noremap <Leader>N Nzz

" count last serch pattern accurence
noremap <Leader>sc :%s///gn<CR>

" edit vimrc
:nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
" apply vimrc
:nnoremap <Leader>sv :source $MYVIMRC<CR>

" past yank register content
::nnoremap <Leader>p "0p

" window resize 
nnoremap <Leader>l :exe "vertical resize +5"<CR>
nnoremap <Leader>h :exe "vertical resize -5"<CR>
nnoremap <Leader>k :exe "resize +5"<CR>
nnoremap <Leader>j :exe "resize -5"<CR>

" buffers navigation
nnoremap <Leader>[ :bp<CR>
nnoremap <Leader>] :bn<CR>


" NERDTree
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
