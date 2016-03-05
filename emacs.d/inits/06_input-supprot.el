
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

;; key-bind setting
(setq ac-use-menu-map t)
(define-key ac-menu-map (kbd "C-n")   'ac-next)
(define-key ac-menu-map (kbd "C-p")   'ac-previous)
(define-key ac-menu-map (kbd "M-TAB") nil)



;;; company

(require 'company)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
(company-quickhelp 1)

;; kbd
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-i") 'company-complete-selection)


;;; yasnippet

(require 'yasnippet) ; not yasnippet-bundle
(yas/initialize)
(setq yas/root-directory '("~/.emacs.d/mysnippets"))

;; Map `yas/load-directory' to every element
(mapc 'yas/load-directory yas/root-directory)

(yas-global-mode 1)


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
