
;;; auto-insert

(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert/")
(define-auto-insert "\\.rb$" "ruby-template.rb")
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
(yas-global-mode 1)
(setq yas-snippet-dirs '("~/.emacs.d/mysnippets"))
