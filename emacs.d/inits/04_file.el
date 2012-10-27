
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



;;; session

(require 'session)
(add-hook 'after-init-hook 'session-initialize)



;;; igrep

(autoload 'igrep "igrep"
   "*Run `grep` PROGRAM to match REGEX in FILES..." t)
(autoload 'igrep-find "igrep"
   "*Run `grep` via `find`..." t)
(autoload 'igrep-visited-files "igrep"
   "*Run `grep` ... on all visited files." t)
(autoload 'dired-do-igrep "igrep"
   "*Run `grep` on the marked (or next prefix ARG) files." t)
(autoload 'dired-do-igrep-find "igrep"
   "*Run `grep` via `find` on the marked (or next prefix ARG) directories." t)
(autoload 'Buffer-menu-igrep "igrep"
  "*Run `grep` on the files visited in buffers marked with '>'." t)
(autoload 'igrep-insinuate "igrep"
  "Define `grep' aliases for the corresponding `igrep' commands." t)



;;; grep-edit

(require 'grep-edit)




;;; open-junk-file

(require 'open-junk-file)

;; C-x C-zで試行錯誤用のファイルを開く
(global-set-key (kbd "C-x C-z") 'open-junk-file)



;;; resentf

;; 最大履歴item数
(setq recentf-max-saved-items 3000)

(require 'recentf-ext)



;;; others

;; ファイルの先頭が #! で始まるファイルに実行権限をつける
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)


;; 履歴を保存
(savehist-mode t)
