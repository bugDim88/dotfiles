-- plugins settings (vim-plug tool is used)
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'yanqd0/android-log.vim'

-- FZF
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install'] })
Plug 'junegunn/fzf.vim'

-- NERDTree
Plug 'preservim/nerdtree'

Plug 'tpope/vim-fugitive'
Plug 'jcherven/jummidark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/textutil.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'mhinz/vim-janah'
Plug 'mtdl9/vim-log-highlighting'
Plug 'mhinz/vim-startify'

Plug 'vimwiki/vimwiki'

Plug 'NLKNguyen/papercolor-theme'

-- Telescope and it's deps
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
-- Treesiter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})

vim.call('plug#end')

-- Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
