;;; 01_helm.el --- helm settings

;;; Commentary:

;;; Code:

(require 'helm)


;; kbd
(define-key global-map (kbd "C-;")   'helm-recentf)
(define-key global-map (kbd "M-x")   'helm-M-x)
(define-key global-map (kbd "M-y")   'helm-show-kill-ring)
(define-key global-map (kbd "M-r")   'helm-resume)
(define-key global-map (kbd "C-c i") 'helm-imenu)
(define-key global-map (kbd "C-c g") 'helm-git-grep)
(define-key global-map (kbd "C-x b") 'helm-buffers-list)
(define-key global-map (kbd "C-M-h") 'helm-apropos)
