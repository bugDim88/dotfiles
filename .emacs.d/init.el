(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Evil mode (vim keybindings)
(require 'evil)
(evil-mode 1)


(setq inhibit-startup-message t ; Don't show the splash screen
      visible-bell nil)         ; Flash when bell ring

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; display line numbers in every buffer
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(load-theme 'deeper-blue t)

(hl-line-mode 1)

;; for M-x recent-open-files
(recentf-mode 1)


;; Save minibuffer history
;; use M-n and M-p for next prev in history
(setq history-length 25)
(savehist-mode 1)


;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)


;; Don't pop up UI dialogs when prompting
(setq use-dialog-box nil)


;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)
;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)
