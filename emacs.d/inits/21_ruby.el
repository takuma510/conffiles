;;; 21_ruby.el --- ruby settings

;;; Commentary:

;;; Code:


;; ruby-mode files
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ruby$" . ruby-mode))

;; ruby-electric
(require 'ruby-electric)

;; inf-ruby
(require 'inf-ruby)
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-eval-binding "Pry.toplevel_binding")
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)

;; ruby-block
(require 'ruby-block)
(setq ruby-block-highlight-toggle t)

;; style
(setq ruby-deep-indent-paren-style nil)

;; minitest
(require 'minitest)
(add-hook 'ruby-mode-hook 'minitest-mode)

(add-hook 'ruby-mode-hook #'linum-on)         ; Enable linum-mode
(setq ruby-insert-encoding-magic-comment nil) ; Disable encoding magic comment


;;; 21_ruby.el ends here
