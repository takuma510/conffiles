;;; 06_company.el --- company-mode settings          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(require 'company)

(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
(global-company-mode t)
(company-quickhelp-mode 1)

;; kbd
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-i") 'company-complete-selection)


;;; 06_company.el ends here
