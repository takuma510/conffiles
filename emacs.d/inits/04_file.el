
;;;; ファイル関連


;;; バックアップファイル

;; バックアップファイル作成無効
(setq backup-inhibited t)

;; バックアップファイル*.~作成無効化
(setq make-backup-files nil)

;; バックアップファイル.#*無効化
(setq auto-save-default nil)



;;; 自動保存

(require 'auto-save-buffers)
(run-with-idle-timer 1 t 'auto-save-buffers) ; アイドル1秒で保存



;;; indent

;; TABはつねに現在行の 字下げをやり直します
(setq c-tab-always-indent t)

;; インデントをタブでなく空白で(バッファ毎に設定可能)
(setq-default indent-tabs-mode nil)

;; タブは空白2文字で表示する
(setq-default tab-width 2)

;; 前と同じ行の幅にインデント
(setq indent-line-function 'indent-relative-maybe)



;;; ipa(ファイルに直接書き込まずメモをする)
(require 'ipa)
;; anythingインターフェース
(require 'anything-ipa)



;;; others

;; ファイルの先頭が #! で始まるファイルに実行権限をつける
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
