;;; 05_helm.el --- helm settings

;;; Commentary:

;;; Code:


(require 'helm)

;; global kbd
(define-key global-map (kbd "C-;")   'helm-recentf)
(define-key global-map (kbd "M-x")   'helm-M-x)
(define-key global-map (kbd "M-y")   'helm-show-kill-ring)
(define-key global-map (kbd "M-r")   'helm-resume)
(define-key global-map (kbd "C-c i") 'helm-imenu)
(define-key global-map (kbd "C-t e") 'helm-elscreen)
(define-key global-map (kbd "C-c g") 'helm-git-grep)
(define-key global-map (kbd "C-x b") 'helm-buffers-list)
(define-key global-map (kbd "C-M-h") 'helm-apropos)


;; helm-gtags
(require 'helm-config)
(require 'helm-gtags)

;; helm-gtags kbd
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))


;;; 05_helm.el ends here
