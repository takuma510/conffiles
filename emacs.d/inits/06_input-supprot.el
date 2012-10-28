
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
(setq ac-use-menu-map t)
(define-key ac-menu-map (kbd "C-n")   'ac-next)
(define-key ac-menu-map (kbd "C-p")   'ac-previous)
(define-key ac-menu-map (kbd "M-TAB") nil)



;;; yasnippet

;; yasnippet-0.6.1c
(add-to-list 'load-path
             "~/.emacs.d/manual-install/yasnippet-0.6.1c")
(require 'yasnippet) ; not yasnippet-bundle
(yas/initialize)
(setq yas/root-directory '("~/.emacs.d/mysnippets"
                           "~/.emacs.d/manual-install/yasnippet-0.6.1c/snippets"))

;; Map `yas/load-directory' to every element
(mapc 'yas/load-directory yas/root-directory)

;; yasnippet-config
(require 'yasnippet-config)

;; enable yasnippet
(defun yas/advise-indent-function (function-symbol)
  (eval `(defadvice ,function-symbol (around yas/try-expand-first activate)
           ,(format
             "Try to expand a snippet before point, then call `%s' as usual"
             function-symbol)
           (let ((yas/fallback-behavior nil))
             (unless (and (interactive-p)
                          (yas/expand))
               ad-do-it)))))


(yas/advise-indent-function 'c-indent-line-or-region)  ; on groovy-mode
(yas/advise-indent-function 'ruby-indent-command)  ; on ruby-mode
