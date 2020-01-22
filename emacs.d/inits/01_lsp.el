;;; 01_lsp.el -- display settings

;;; Commentary:

;;; Code:


(require 'lsp-mode)
(require 'lsp-ui)

;; config
(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-header t)
(setq lsp-ui-doc-include-signature t)
(setq lsp-ui-doc-max-width 150)
(setq lsp-ui-doc-max-height 30)
(setq lsp-ui-peek-enable t)

;; hook
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(add-hook 'ruby-mode-hook #'lsp)
(add-hook 'go-mode-hook #'lsp)
(add-hook 'js2-mode-hook #'lsp)
(add-hook 'typescript-mode-hook #'lsp)

;; dap-mode
(dap-mode 1)
(dap-ui-mode 1)
;; enables mouse hover support
(dap-tooltip-mode 1)
;; use tooltips for mouse hover
;; if it is not enabled `dap-mode' will use the minibuffer.
(tooltip-mode 1)

;;; 01_lsp.el ends here
