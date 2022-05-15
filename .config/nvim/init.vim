set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
lua require('basic')
source ~/.vimrc
lua require('mappings')
