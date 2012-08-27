
;;;; ファイル分割するほどではない設定群


;;; 文字コード

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)



;;; スタートアップ画面非表示
(setq inhibit-startup-message t)



;;; ジェネリックモード有効化
(require 'generic-x)