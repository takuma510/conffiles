;;; 07_yasnippet.el --- yasnippet-mode settings

;;; Commentary:

;;; Code:


(require 'yasnippet) ; not yasnippet-bundle
(yas-global-mode 1)

(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)

;;; 07_yasnippet.el ends here
