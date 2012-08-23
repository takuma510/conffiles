
;;;; ファイル関連

;;; バックアップファイルは作成しない

(setq backup-inhibited t)
(setq make-backup-files nil)



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

;; returnで改行とインデント(デフォルトはC-j)
(global-set-key "\C-m" 'newline-and-indent)
