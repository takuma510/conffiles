;;; 00_global.el -- global settings

;;; Commentary:

;;; Code:


;;; Zsh

(setenv "SHELL" "/bin/zsh")
(setq shell-file-name "/bin/zsh") ; M-x shell-command


;;; Others

(require 'generic-x)                ; ジェネリックモード有効化
(setq inhibit-startup-message t)    ; スタートアップ画面非表示
(savehist-mode t)                   ; 履歴を保存
(setq backup-inhibited t)           ; バックアップファイル作成無効
(setq make-backup-files nil)        ; バックアップファイル*.~作成無効化
(setq auto-save-default nil)        ; バックアップファイル.#*無効化
(setq-default indent-tabs-mode nil) ; Notabs
(setq-default tab-width 2)          ; タブは空白2文字で表示する
(exec-path-from-shell-initialize)   ; inherit PATH from shell

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets) ; filename<dir>形式
(setq uniquify-ignore-buffers-re "*[^*]+*") ; *で囲まれたファイル名は対象外

;; open-junk-file
(require 'open-junk-file)
(global-set-key (kbd "C-x C-z") 'open-junk-file) ; C-x C-zで試行錯誤用のファイルを開く

;; 自動保存
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 1) ; 指定のアイドル秒で保存
(auto-save-buffers-enhanced t)

;; indent
(setq c-tab-always-indent t)        ; TABはつねに現在行の 字下げをやり直す
(setq-default indent-tabs-mode nil) ; インデントをタブでなく空白で(バッファ毎に設定可能)
(setq indent-line-function 'indent-relative-maybe)  ; 前と同じ行の幅にインデント

;; session
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; resentf
(require 'recentf-ext)
(setq recentf-max-saved-items 3000)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; winner-undo
(winner-mode 1)
(global-set-key (kbd "C-q") 'winner-undo)

;; kbd
(define-key global-map (kbd "C-c o") 'goto-line)
(define-key global-map [?¥] [?\\])               ; ¥の代わりに\を入力する

;; 文字コード
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; Open a current buffer with ATOM
(defun open-atom ()
  (interactive)
  (call-process
   "atom" nil nil nil buffer-file-name))


;;; 00_global.el ends here
