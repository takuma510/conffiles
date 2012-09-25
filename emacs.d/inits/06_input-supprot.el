
;;;; input support


;;; auto-insert

(auto-insert-mode)

;; templateファイル置き場
(setq auto-insert-directory "~/.emacs.d/insert/")

;; ruby-template
(define-auto-insert "\\.rb$" "ruby-template.rb")

;; sh-template
(define-auto-insert "\\.sh$" "sh-template.sh")



;;; auto-complete

(require 'auto-complete-config)
(global-auto-complete-mode t)

;; key-bind setting
(define-key ac-menu-map (kbd "C-n")   'ac-next)
(define-key ac-menu-map (kbd "C-p")   'ac-previous)
(define-key ac-menu-map (kbd "M-TAB") nil)
