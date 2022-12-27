(module modules.common
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util
            util util}})

;; Изменение размеров шрифта
(nvim.set_keymap :n "+" ":call FontSizeInc()<cr>" {:noremap true})
(nvim.set_keymap :n "-" ":call FontSizeDec()<cr>" {:noremap true})
(set nvim.o.guifont  "Hack Nerd Font Mono:h20")

(set nvim.g.maplocalleader ",")

(util.nnoremap "t" "Lexplore")
(nvim.set_keymap :n "ftf" ":Lexplore %:p:h<CR>" {:noremap true})



(defn change-font-size
  [diff]
  (let [font nvim.o.guifont
        size (tonumber (font:match "h(%d+)$"))
        size* (+ size diff)
        font* (font:gsub "%d+$" size*)]
    (set nvim.o.guifont font*)))

(defn font-size-inc
  []
  (change-font-size 1))

(defn font-size-dec
  []
  (change-font-size -1))

(nu.fn-bridge
  :FontSizeInc
  :modules.common :font-size-inc)

(nu.fn-bridge
  :FontSizeDec
  :modules.common :font-size-dec)
