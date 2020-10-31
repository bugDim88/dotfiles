set backspace=indent,eol,start
set number
set autoindent


" syntax highlight
syntax on

colorscheme jummidark
set background=dark

set rtp+=/usr/local/opt/fzf

" for powerline bottom bar
set laststatus=2

let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-\']

" maps
imap jk <Esc>
map <C-n> :NERDTreeToggle<CR>
