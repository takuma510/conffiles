;;; 24_js.el --- js settings

;;; Commentary:

;;; Code:

(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)) ; use as major mode
(setq-default js2-basic-offset 2)                       ; indent
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; js2-jsx-mode
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

;; nodejs
(setq js2-include-node-externs t)

(add-hook 'js2-mode-hook #'linum-on) ; Enable linum-mode


;;; 24_js.el ends here
