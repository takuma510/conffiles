;;; 29_python.el --- python-mode settings

;;; Commentary:

;; ref) http://hamukazu.com/2014/12/05/setting-emacs-for-python/

;;; Code:


;; auto indent
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map (kbd "\C-m") 'newline-and-indent)
            (define-key python-mode-map (kbd "RET") 'newline-and-indent)))

;;; 29_python.el ends here
