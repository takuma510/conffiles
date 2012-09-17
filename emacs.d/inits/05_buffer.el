
;;;; バッファ関連


;;; ファイル名がかぶったときのバッファ名
(require 'uniquify)
;; filename<dir>形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; *で囲まれたファイル名は対象外にする
(setq uniquify-ignore-buffers-re "*[^*]+*")
