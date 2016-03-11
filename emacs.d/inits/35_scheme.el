;;; 35_scheme.el --- scheme settings

;;; Commentary:

;;; Code:


(add-hook 'scheme-mode-hook 'enable-paredit-mode)

;; gosh
(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "gosh -i")

;; gauch info
(defun add-gauche-info-dir ()
  (setq gauche-info-dir
        (substring
         (shell-command-to-string "gauche-config --infodir") 0 -1))
  (setq Info-directory-list
        (cons gauche-info-dir Info-directory-list)))
(if (executable-find "gauche-config")
    (add-gauche-info-dir))


;;; 35_scheme.el ends here
