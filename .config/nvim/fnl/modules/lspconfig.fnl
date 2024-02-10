(module modules.lspconfig
  {require {nvim aniseed.nvim
            util util
            lsp lspconfig}})

(defn- map [from to]
  (util.nnoremap from to))

(defn on-attach
  [client buffer]
  (do 
    (map :gd "lua vim.lsp.buf.definition()")
    (map :gD "lua vim.lsp.buf.declaration()")
    (map :gr "lua vim.lsp.buf.references()")
    (map :gi "lua vim.lsp.buf.implementation()")
    (map :K "lua vim.lsp.buf.hover()")
    (map :<c-k> "lua vim.lsp.buf.signature_help()")
    (map :<c-n> "lua vim.lsp.diagnostic.goto_prev()")
    (map :<c-p> "lua vim.lsp.diagnostic.goto_next()")

    (map :<leader>br "lua vim.lsp.buf.rename()")
    (map :<leader>cf "lua vim.lsp.buf.formatting()")))
;; EXAMPLE https://github.com/rafaeldelboni/cajus-nvim/blob/main/.config/nvim/fnl/config/plugin/lspconfig.fnl
;; To add support to more language servers check:
;; https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

;; Clojure
(lsp.clojure_lsp.setup {:on_attach on-attach})
