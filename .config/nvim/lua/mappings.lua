-- изменение размера шрифта на diff
local function change_font_size(diff)
  local font = vim.o.guifont
  local size = (tonumber(font:match("h(%d+)$")) + diff)
  vim.o.guifont = font:gsub("%d+$", size)
  return nil
end

local function font_size_inc()
    change_font_size(1)
end

local function font_size_dec()
    change_font_size(-1)
end

vim.keymap.set("n", "+", font_size_inc)
vim.keymap.set("n", "-", font_size_dec)

vim.o.guifont = "Hack Nerd Font Mono:h15"

vim.keymap.set("n", "<leader>t", ":Lexplore<CR>")
vim.keymap.set("n", "ftf", ":Lexplore %:p:h<CR>")

-- all buffers to tabs
vim.keymap.set("n", "<leader>bt", ":tab ball<CR>")

-- Telescope START
local telescope = require('telescope')
local telescope_actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions
local big_vertical_theme = {
  layout_strategy = 'vertical',
  layout_config = { 
      height = 0.95,
      width = 0.95
  },
}
telescope.setup {
  pickers = {
    find_files = big_vertical_theme,
    live_grep = big_vertical_theme,
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      previewer = false,
      -- depth = 3,
      hijack_netrw = true,
      -- determines whether to show hidden files
      hidden = true,
      initial_mode = 'normal',
      -- sorting by directories and then files
      grouped = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        -- custom normal mode mappings
        ["n"] = {
          ["l"] = telescope_actions.select_default,
          ["h"] = fb_actions.goto_parent_dir,
        },
      },
    },
  },
}
telescope.load_extension('fzf')
telescope.load_extension('file_browser')

local telescopeFn = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescopeFn.find_files, {})
vim.keymap.set('n', '<leader>fg', telescopeFn.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescopeFn.buffers, {})
vim.keymap.set('n', '<leader>fh', telescopeFn.help_tags, {})
vim.keymap.set('n', '<leader>fc', telescopeFn.command_history, {})
vim.keymap.set('n', '<leader>fq', telescopeFn.search_history, {})
vim.keymap.set('n', '<leader>/', telescopeFn.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fm', ':Telescope file_browser path=%:p:h<CR>')
-- Telescope END


-- netrw START
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
-- netrw END
