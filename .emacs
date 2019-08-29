(tool-bar-mode -1)
(menu-bar-mode -1)

;; Don't make an audible beep
(setq ring-bell-function 'ignore)

(global-set-key (kbd "C-x C-c") 'save-buffer)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-x C-\\") 'kill-emacs)
(global-set-key (kbd "<wheel-left>") 'ignore)
(global-set-key (kbd "<wheel-right>") 'ignore)

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

(package-initialize)
(add-to-list 'package-archives
'("melpa" . "http://melpa.milkbox.net/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rust-mode racket-mode markdown-mode pyenv-mode-auto pyenv-mode blacken typescript-mode prettier-js rjsx-mode web-mode yaml-mode dockerfile-mode go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq js-indent-level 2)
(setq typescript-indent-level 2)

(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(add-hook 'rjsx-mode-hook
	  (lambda ()
	    (add-to-list 'js2-global-externs "chrome")
	    (add-to-list 'js2-global-externs "expect")
	    (add-to-list 'js2-global-externs "fetch")
	    (add-to-list 'js2-global-externs "module")
	    (add-to-list 'js2-global-externs "require")
	    (add-to-list 'js2-global-externs "setTimeout")
	    (add-to-list 'js2-global-externs "test")
	    (add-to-list 'js2-global-externs "URL")
	    (add-to-list 'js2-global-externs "Buffer")
	    (add-to-list 'js2-global-externs "FileReader")
	    (add-to-list 'js2-global-externs "setInterval")
	    (add-to-list 'js2-global-externs "__dirname")
	    (add-to-list 'js2-global-externs "process")
	    ))

(require 'prettier-js)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)

(put 'downcase-region 'disabled nil)

;; M-x json-fix will add go to make a json field encode as lowercase, if you're on the
;; line in the struct defining the field
(fset 'json-fix
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([1 5 1 tab M-S-right 23 25 5 32 96 106 115 111 110 58 34 25 left right M-S-left 24 12 5 34 96] 0 "%d")) arg)))

(setq blacken-executable "/home/lacker/.pyenv/versions/3.7.3/envs/deephex/bin/black")
(setq blacken-line-length 120)
(add-hook 'python-mode-hook 'blacken-mode)

(setq rust-format-on-save t)
