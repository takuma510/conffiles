;;; 37_haskell.el --- haskell mode settings

;;; Commentary:

;;  https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md

;;; Code:


(add-hook 'haskell-mode-hook #'linum-on) ; Enable linum-mode

;; company
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))


;;; 37_haskell.el ends here
