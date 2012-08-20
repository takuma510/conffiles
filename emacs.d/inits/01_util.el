;;
;; 便利機能の追加
;;
;;
;=======================================================================
; auto-install
;=======================================================================
(require 'auto-install)

;; auto-installによってインストールされるEmacs Lispをロードパスに加える
(setq auto-install-directory "~/.emacs.d/auto-install")
(add-to-list 'load-path "~/.emacs.d/auto-install")

;; 起動時にEmacsWikiのページ名を補完候補に加える
(auto-install-update-emacswiki-package-name t)

;; install-elisp.el互換モードにする
(auto-install-compatibility-setup)

;; ediff関連のバッファを1つのフレームにまとめる
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;=======================================================================
; anything
;=======================================================================
(require 'anything-config)
(require 'anything-match-plugin)

;; ファイルリストの表示
(global-set-key (kbd "C-;") 'anything-for-files)


;=======================================================================
; auto-complete
;=======================================================================
(require 'auto-complete-config)
(global-auto-complete-mode 1)