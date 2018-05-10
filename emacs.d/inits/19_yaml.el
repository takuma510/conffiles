;;; 19_yaml.el --- yaml mode

;;; Commentary:

;;; Code:

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(setq yaml-indent-offset 2)

;;; 19_yaml.el ends here
