(module modules.colorschemas
  {require {
            catppuccin catppuccin 
            tokyonight tokyonight
            }})

(catppuccin.setup {
                   :transparent_background true
                   :flavour "frappe"
                   :background {
                                :light "latte"
                                :dark "frappe"
                                }
                   :integrations {
                                  :treesitter true
                                  :telescope {:enable true}
                                  }
                   })

(tokyonight.setup {
                   ;;:transparent true
                   })
