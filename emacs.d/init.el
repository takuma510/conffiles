
;;;; 初めに読み込まれるファイル

;;; load-pathの追加

(add-to-list 'load-path "~/.emacs.d/manual-install")


;;; init-loader

(add-to-list 'load-path "~/.emacs.d/vender/init-loader")
(require 'init-loader)

;; 設定ファイルがあるディレクトリを指定
(init-loader-load "~/.emacs.d/inits")