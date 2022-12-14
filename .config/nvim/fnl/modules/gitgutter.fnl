(module modules.gitgutter
  {require {nvim aniseed.nvim
            telescope telescope
            util util}})

(set nvim.g.updatetime  100)
(set nvim.g.gitgutter_enabled 0)
(set nvim.g.gitgutter_grep  "rg")
(util.nnoremap :git "GitGutterToggle")
