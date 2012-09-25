
;;;; ruby-mode


;;; rinari

(add-to-list 'load-path "~/.emacs.d/vender/rinari")
(require 'rinari)



;;; ruby-electric
;;; [description] 括弧などを自動挿入

(require 'ruby-electric)



;;; inf-ruby
;;; [description] emacsからirb

(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)))



;;; ruby-block
;;; [description] endに対応する行のハイライト

(setq ruby-block-highlight-toggle t)



;;; ruby-mode-hook

(defun my-ruby-mode-hooks ()
  (inf-ruby-keys)
  (ruby-electric-mode t)
  (ruby-block-mode t))

(add-hook 'ruby-mode-hook 'my-ruby-mode-hooks)
