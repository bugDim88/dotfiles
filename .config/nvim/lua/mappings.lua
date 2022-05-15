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
