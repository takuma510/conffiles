;;; 11_sh.el --- shell script mode settings

;;; Commentary:

;;; Code:


;; mode-alist
(add-to-list 'auto-mode-alist '("\zshrc$" . sh-mode))

;; indent
(add-hook 'sh-mode-hook
          (lambda ()
            (setq tab-width        2
                  sh-basic-offset  2)))


;;; 11_sh.el ends here
