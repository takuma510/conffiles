;;; 01_lsp.el -- display settings

;;; Commentary:

;;; Code:


(require 'lsp-mode)

(add-hook 'ruby-mode-hook #'lsp)
(add-hook 'go-mode-hook #'lsp)

;;; 01_lsp.el ends here
