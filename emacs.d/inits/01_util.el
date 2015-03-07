
;;;; 便利機能の追加


;;; helm

(require 'helm)

;; ファイルリストの表示
(global-set-key (kbd "C-;") 'helm-recentf)


;;; undo-tree

(add-to-list 'load-path "~/.emacs.d/vender/undo")
(require 'undo-tree)
(global-undo-tree-mode)


;;; key map

(define-key global-map [?¥] [?\\])  ;; ¥の代わりに\を入力する
