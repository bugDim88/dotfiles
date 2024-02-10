(module modules.dart
  {require {nvim aniseed.nvim}})

(set nvim.g.dart_format_on_save true)

(set nvim.g.lsc_server_commands {
          :dart "dart_language_server"
                                 })

(set nvim.g.lsc_enable_autocomplete false)
(set nvim.g.lsc_auto_map {
                            ;; CTRL-X CTRL-U, для скрола CTRL-N | CTRL-P
                            :Completion "completefunc"
                            :ShowHover true
                            :GoToDefinition "gD"
                            ;:GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
                            :FindReferences "gr"
                            ;:NextReference': '<C-n>',
                            ;:PreviousReference': '<C-p>',
                            :FindImplementations "gI"
                            ;:FindCodeActions': 'ga',
                            :Rename "gR"
                            ;:DocumentSymbol': 'go',
                            ;:WorkspaceSymbol': 'gS',
                            ;:SignatureHelp': 'gm',
                          })

;; отключаем превью с докой при автокомплите
(vim.cmd "set completeopt-=preview")

(set nvim.g.lsc_trace_level "messages")

