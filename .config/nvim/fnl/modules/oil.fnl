(module modules.oil
  {require {nvim aniseed.nvim
            oil oil
            actions oil.actions
            {: kset} util}})


(oil.setup
  {:keymaps
   {:th actions.toggle_hidden
    :<Tab> actions.preview
    :<C-v> actions.select_vsplit
    :<C-t> actions.select_tab
    :<C-h> actions.parent
    :<C-l> actions.select
    :zh actions.toggle_hidden
    :cwd actions.open_cwd
    :cd actions.cd
    :tcd actions.tcd
    :q actions.close
    }})

(kset :n :<Leader>ft oil.open)
