(module modules.oil
  {require {nvim aniseed.nvim
            oil oil
            actions oil.actions
            {: kset} util}})


(oil.setup
  {:keymaps
   {:th actions.toggle_hidden
    :<Tab> actions.preview
    :<Leader>v actions.select_vsplit
    :h actions.parent
    :l actions.select
    :cwd actions.open_cwd
    :cd actions.cd
    :tcd actions.tcd
    :q actions.close
    }})

(kset :n :<Leader>ft oil.open)
