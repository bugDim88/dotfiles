(module modules.telescope
  {require {nvim aniseed.nvim
            telescope telescope
            util util}})

(local big-vertical-theme {
  :layout_strategy  "vertical"
  :layout_config  { 
      :height  0.95
      :width  0.9
  }})

(local telescope-actions (require "telescope.actions"))
(local fb-actions (-> (require "telescope")
                        (. :extensions)
                         (. :file_browser)
                         (. :actions)))

(telescope.setup {
                  :defaults {
                      :mappings {
                                 :i {
                                     "<C-j>" telescope-actions.move_selection_next
                                     "<C-k>" telescope-actions.move_selection_previous
                                     }
                                 }
                               }
                  :pickers {
                            :find_files big-vertical-theme
                            :live_grep big-vertical-theme
                            }
                  :extensions {
                               :file_browser {
                                  :theme  "ivy"
                                  :previewer  false
                                  ;; :depth  3,
                                  :hijack_netrw  true
                                  ;; :determines whether to show hidden files
                                  :hidden true
                                  ;; :initial_mode = 'normal',
                                  ;; :sorting by directories and then files
                                  :grouped  true
                                  :mappings {
                                             :i {
                                                 "<C-l>" telescope-actions.select_default
                                                 "<C-h>" fb-actions.goto_parent_dir
                                                 }
                                             :n {
                                                :l telescope-actions.select_default
                                                :h fb-actions.goto_parent_dir
                                                }
                                             }
                                  }
                               }


                  })

(telescope.load_extension "fzf")
(telescope.load_extension "file_browser")

(local builtin-prefix "lua require('telescope.builtin').")

(util.nnoremap :ff (.. builtin-prefix "find_files()"))
(util.nnoremap :fg (.. builtin-prefix "live_grep()"))
(util.nnoremap :fb (.. builtin-prefix "buffers()"))
(util.nnoremap :fh (.. builtin-prefix "help_tags()"))
(util.nnoremap :ch (.. builtin-prefix "command_history()"))
(util.nnoremap :fc (.. builtin-prefix "commands()"))
(util.nnoremap :fq (.. builtin-prefix "search_history()"))
(util.nnoremap :/ (.. builtin-prefix "current_buffer_fuzzy_find()"))
(util.nnoremap :fm "Telescope file_browser path=%:p:h")

  
