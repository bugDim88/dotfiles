(module init
  {require {core aniseed.core
            nvim aniseed.nvim
            util util}})

;; (local fennel (require :fennel)) 
;; (fn _G.pp [x] (print (fennel.view x)))
;; (_G.pp (util.glob (.. util.config-path "/lua/modules/*.lua")))
;; (print (.. util.config-path "/lua/modules/*.lua"))

;; Load all modules in no particular order.
(->> (util.glob (.. util.config-path "/lua/modules/*.lua"))
     (core.run! (fn [path]
                  (require (string.gsub path ".*/(.-)/(.-)%.lua" "%1.%2")))))
