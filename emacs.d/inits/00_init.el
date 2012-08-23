
;;;; ファイル分割するほどではない設定群

;;; 文字コード

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)


;;; ファイル関連

;; バックアップファイルは作成しない
(setq backup-inhibited t)
(setq make-backup-files nil)

;; 自動保存
(require 'auto-save-buffers)
(run-with-idle-timer 1 t 'auto-save-buffers) ; アイドル1秒で保存
