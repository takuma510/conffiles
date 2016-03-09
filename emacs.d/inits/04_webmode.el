;;; 04_webmode.el --- web-mode settings

;;; Commentary:

;;; Code:


(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-hook 'web-mode-hook #'linum-on)


;;; 04_webmode.el ends here
