(module modules.conjure
  {require {nvim aniseed.nvim}})

(set nvim.g.conjure#extract#tree_sitter#enabled true)
  
(set nvim.g.conjure#log#botright true)
(set nvim.g.conjure#mapping#doc_word "k")
(set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
