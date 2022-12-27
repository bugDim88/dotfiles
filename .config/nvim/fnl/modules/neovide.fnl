(module modules.neovide
  {require {nvim aniseed.nvim
            util util}})

(defn apply-settings
  []
  (set nvim.g.neovide_cursor_vfx_mode "railgun")
  (nvim.set_keymap "" "<D-v>" "\"+p" {:noremap true}))


(let [ok? nvim.g.neovide]
  (when ok?
   (apply-settings)))

