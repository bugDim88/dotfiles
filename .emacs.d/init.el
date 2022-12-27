(require 'package)
(add-to-list 'package-archives
             ;; '("melpa-stable" . "https://stable.melpa.org/packages/") t)
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    modus-themes ; theme by AAA color contrast rules
    ))


;; install my-packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; ==
;; == DOOM Themes ==
;; ==
;; default font-size
(set-face-attribute 'default nil  :font "JetBrains Mono" :height 230)
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-dracula t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config))
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))


;; ==
;; == IVY Config ==
;; ==
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-j" . ivy-next-line)
	 ("C-l" . ivy-done)
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-j" . ivy-next-line)
	 ("C-d" . ivy-reverse-i-search-map))
  :config (ivy-mode 1))

(use-package counsel
  :bind(("M-x" . counsel-M-x)
	("M-x" . counsel-M-x)
	("C-x C-f" . counsel-find-file)
	("C-x b" . counsel-switch-buffer)
	:map minibuffer-local-map
	("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))

;; ivy i-search
(use-package swiper)

;; пока не очень полезная фигня
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; helping with describe ivy search results
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))
;;:config
;;(setq ivy-format-functions-alist t))

;; package for more comfort help serfing
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-describe-variable)
  ([remap describe-symbol] . helpful-at-point))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

;; ==
;; == General ==
;; ==
(defun bdv/open-init-file ()
  "Open init file."
  (interactive)
  (find-file user-init-file))

(defun bdv/open-wiki-dir ()
  "Open wiki directory."
  (interactive)
  (dired "~/Dropbox/wiki_org"))

(use-package general
  :config
  (general-override-mode)
  (general-create-definer vim/leader-key
    :states `(normal visual)
    :keymaps `(override)
    :prefix "SPC")
  (general-create-definer vim/local-leader-key
    :keymaps `(normal visual)
    :prefix "SPC SPC")
  (vim/leader-key
    "cs" '(counsel-load-theme :which-key "choose theme")
    "fc" '(format-all-buffer :which-key "format code in current buffer")
    "wc" "C-c C-, s" :which-key "wrap code block"

    "bj" '(previous-buffer :which-key "previous buffer")
    "bk" '(next-buffer :which-key "next buffer")
    "bs" '(mode-line-other-buffer :which-key "switch buffer to most recent")
    "bf" '(counsel-switch-buffer :which-key "find buffer")

    "os" '(bdv/open-init-file :which-key "edit emacs settings")
    "ow" '(bdv/open-wiki-dir :whick-key "open wiki")
    )

  (vim/local-leader-key
    :states 'normal
    :keymaps 'clojure-mode-map
    "fc" 'cider-format-buffer
    "." 'cider-find-var
    "," 'cider-pop-back
    )
  )


;; ==
;; == EVIL Mode (vim key bindings) ==
;; ==
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (evil-ex-define-cmd "q" 'kill-this-buffer))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))



;; ==
;; == MAGIT ==
;; ==
(use-package magit)
;; (use-package evil-magit // DON'T work with MELPA
;;:after magit)


;; ==
;; == ORG MODE ==
;; ==
(defun bdv/org-mode-setup ()
  (org-indent-mode)
  ;;(variable-pitch-mode 1)
  (visual-line-mode 1))

(defun bdv/org-font-setup ()
  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
		  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "JetBrains Mono" :weight 'regular :height (cdr face))))

(use-package org
  :hook (org-mode . bdv/org-mode-setup)
  :custom
  (org-hide-emphasis-markers t)
  :config
  (setq org-ellipsis " ...")
  (bdv/org-font-setup)
  )

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun bdv/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . bdv/org-mode-visual-fill))


;; ==
;; == PROJECTILE ==
;; ==
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Coding")
    (setq projectile-project-search-path '("~/Coding" "~/Coding/closure")))
  (setq projectile-switch-project-action #'projectile-dired))

(setq inhibit-startup-message t ; Don't show the splash screen
      visible-bell nil)         ; Flash when bell ring


;; ==
;; == CODE FORMATTER ==
;; ==
(use-package format-all)


;; ==
;; == TERM MODE ==
;; ==
(use-package term
  :config
  (setq explicit-shell-file-name "zsh") ;; Change this to zsh, etc
  ;;(setq explicit-zsh-args '())         ;; Use 'explicit-<shell>-args for shell-specific args

  ;; Match the default Bash shell prompt.  Update this if you have a custom prompt
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

;; при установке возможно нужно будет вручную скомпилировать бинарник
;; cd ~
;; cd .emacs.d/elpa/vterm-20210409.1558
;; mkdir build
;; cd build
;; cmake ..
;; make
(use-package vterm
  :commands vterm
  :config
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")  ;; Set this to match your custom shell prompt
  ;;(setq vterm-shell "zsh")                       ;; Set this to customize the shell to launch
  (setq vterm-max-scrollback 10000))


;; ==
;; == DIRED ==
;; ==
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-lagho --group-directories-first"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer)
  (setq insert-directory-program "/usr/local/bin/gls"
	dired-use-ls-dired t))
(use-package dired-single)
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))
(use-package all-the-icons
  :if (display-graphic-p))
(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))


;; ==
;; == CLOJURE ==
;; ==
(use-package exec-path-from-shell)
;; :config
;; (if(eq system-type 'darvin)
;;     (exec-path-from-shell-initialize)))
(use-package cider
  :init (setq cider-special-mode-truncate-lines nil
	      cider-repl-display-in-current-window t))

;; Cold repl start. Build path environment on macOS
(defun bdv/repl-cold-start ()
  (interactive)
  (if(eq system-type 'darwin)
      (exec-path-from-shell-initialize))
  (cider-jack-in ()))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; display line numbers in every buffer
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(setq display-line-numbers-type 'relative)


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

;; initial full-screen mode
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))


;; Don't pop up UI dialogs when prompting
(setq use-dialog-box nil)


;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)
;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; Make ESC quit promts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
