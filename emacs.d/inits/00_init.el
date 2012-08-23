
;;;; ファイル分割するほどではない設定群

;;; 文字コード

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)


;;; ファイル関連

;; バックアップファイルは作成しない
(setq backup-inhibited t)
(setq make-backup-files nil)
