;;; 36_css.el --- css-mode settings

;;; Commentary:

;;; Code:


(require 'css-mode)

(add-hook 'css-mode-hook #'linum-on)
(add-hook 'css-mode-hook 'rainbow-mode)
(setq css-indent-offset 2)


;;; 36_css.el ends here
