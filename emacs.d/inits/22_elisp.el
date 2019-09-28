;;; 22_elisp.el --- emacs lisp mode

;;; Commentary:

;;; Code:


(require 'lispxmp)

;; C-c C-dと押すと註釈される
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)


;;; ParEdit

(require 'paredit)

;; hooks
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)


;; Disable company-mode
(add-hook 'emacs-lisp-mode-hook (lambda () (company-mode -1)))


;; Enable linum-mode on emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook #'linum-on)


;;; 22_elisp.el ends here
