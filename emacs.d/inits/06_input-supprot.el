
;;;; input support


;;; auto-insert

(auto-insert-mode)

;; templateファイル置き場
(setq auto-insert-directory "~/.emacs.d/insert/")

;; ruby-template
(define-auto-insert "\\.rb$" "ruby-template.rb")

;; sh-template
(define-auto-insert "\\.sh$" "sh-template.sh")
