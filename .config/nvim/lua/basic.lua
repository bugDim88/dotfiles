-- plugins settings (vim-plug tool is used)
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

-- Plug 'mileszs/ack.vim'

-- FZF
-- Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install'] })
-- Plug 'junegunn/fzf.vim'

-- Plug 'tpope/vim-fugitive'
-- Plug 'jcherven/jummidark.vim'
-- Plug 'mhinz/vim-janah'
-- Plug 'mtdl9/vim-log-highlighting'
Plug 'yanqd0/android-log.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'mhinz/vim-startify'
-- Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/textutil.vim'
Plug 'vimwiki/vimwiki'

Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'

-- Telescope and it's deps
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
-- Treesiter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Conjure
Plug 'Olical/conjure'
Plug 'Olical/aniseed'

Plug 'nvim-lualine/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'stevearc/oil.nvim'
Plug 'bugDim88/presenting.vim'
vim.call('plug#end')
