(module modules.lualine
  {require { lualine lualine }})

(lualine.setup {
                :options {
                          :icons_enabled false
                          :component_separators {
                                                 :left ""
                                                 :right ""
                                                 }
                          :section_separators {
                                                 :left ""
                                                 :right ""
                                                 }
                         } 

                }
  )
