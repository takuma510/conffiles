
;;;; ファイル関連

;;; バックアップファイルは作成しない

(setq backup-inhibited t)
(setq make-backup-files nil)


;;; 自動保存
(require 'auto-save-buffers)
(run-with-idle-timer 1 t 'auto-save-buffers) ; アイドル1秒で保存
