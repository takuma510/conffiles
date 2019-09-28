;;; 05_ivy-counsel.el --- helm settings

;;; Commentary:

;;; Code:


(ivy-mode 1) ;; デフォルトの入力補完がivyになる
(counsel-mode 1)
;; M-x, C-x C-fなどのEmacsの基本的な組み込みコマンドをivy版にリマップする

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-;") 'counsel-recentf)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)

;;; 05_ivy-counsel.el ends here
