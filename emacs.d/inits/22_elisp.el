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


;;; auto-complete
(defun add-sources-to-ac-source ()
  (add-to-list 'ac-sources 'ac-source-symbols))
(add-hook 'emacs-lisp-mode-hook 'add-sources-to-ac-source)
(add-hook 'emacs-lisp-mode-hook 'auto-complete-mode)


;; Enable linum-mode on emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook #'linum-on)


;;; 22_elisp.el ends here
