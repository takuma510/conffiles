
;;; Typescript-mode (installed by package.el with tss)
;;; https://github.com/aki2o/emacs-tss/blob/master/README-ja.md

;; 同梱されたtypescript.elを使う場合
(require 'typescript)

(require 'tss)

;; ポイントしている要素についてのヘルプをポップアップ表示するキー
(setq tss-popup-help-key "C-:")

;; ポイントしている要素の定義元へジャンプするキー
(setq tss-jump-to-definition-key "C->")

;; 推奨設定を行う
(tss-config-default)
