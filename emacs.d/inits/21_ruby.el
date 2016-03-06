;;; 21_ruby.el --- ruby settings

;;; Commentary:

;;; Code:


;; ruby-mode files
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

;; rbenv
(require 'rbenv)
(global-rbenv-mode)
(setq rbenv-installation-dir "/usr/local/var/rbenv")
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
                       (getenv "HOME") "/.rbenv/bin:"
                       (getenv "PATH")))
(setq exec-path (cons
                 (concat (getenv "HOME") "/.rbenv/shims")
                 (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

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
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)


;; company
(eval-after-load 'company
  '(push 'company-robe company-backends))
(add-hook 'ruby-mode-hook 'company-mode)

;; style
(setq ruby-deep-indent-paren-style nil)
;; アクセス修飾子のインデントを下げる
(push "public"    ruby-block-mid-keywords)
(push "protected" ruby-block-mid-keywords)
(push "private"   ruby-block-mid-keywords)
(setq ruby-block-mid-re (regexp-opt ruby-block-mid-keywords))
(setq ruby-negative
      (concat "^[ \t]*\\(\\(" ruby-block-mid-re "\\)\\>\\|"
              ruby-block-end-re "\\|}\\|\\]\\)"))

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

;; auto-insert
(define-auto-insert "\\.rb$" "ruby-template.rb")


;;; 21_ruby.el ends here
