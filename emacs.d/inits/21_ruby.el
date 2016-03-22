;;; 21_ruby.el --- ruby settings

;;; Commentary:

;;; Code:


;; ruby-mode files
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

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

;; robe
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(autoload 'robe-mode
  "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(add-hook 'robe-mode-hook 'robe-start)

;; company
(eval-after-load 'company
  '(push 'company-robe company-backends))

;; style
(setq ruby-deep-indent-paren-style nil)

;; ruby-mode-hook
(defun my-ruby-mode-hooks ()
  (ruby-electric-mode t)
  (ruby-block-mode t))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hooks)

;; minitest
(require 'minitest)
(add-hook 'ruby-mode-hook 'minitest-mode)

;; Enable linum-mode on ruby-mode
(add-hook 'ruby-mode-hook #'linum-on)


;;; 21_ruby.el ends here
