;;; 00_global.el -- global settings

;;; Commentary:

;;; Code:


;;; Elscreen

;; kbd
(global-unset-key "\C-t")
(setq elscreen-prefix-key (kbd "C-t"))
(elscreen-start)

;; settings
(setq elscreen-display-tab nil)

;; elscreen-persist
(require 'elscreen-persist)
(elscreen-persist-mode 1)


;;; auto-insert

(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert/")

;;; auto-complete

(require 'auto-complete-config)

;; key-bind setting
(setq ac-use-menu-map t)
(define-key ac-menu-map (kbd "C-n")   'ac-next)
(define-key ac-menu-map (kbd "C-p")   'ac-previous)
(define-key ac-menu-map (kbd "M-TAB") nil)


;;; company

(require 'company)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
(global-company-mode t)
(company-quickhelp-mode 1)

;; kbd
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-i") 'company-complete-selection)


;;; yasnippet

(require 'yasnippet) ; not yasnippet-bundle
(yas-global-mode 1)
(setq yas-snippet-dirs '("~/.emacs.d/mysnippets"))


;;; Buffer

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets) ;; filename<dir>形式のバッファ名にする
(setq uniquify-ignore-buffers-re "*[^*]+*") ;; *で囲まれたファイル名は対象外にする


;;; open-junk-file

(require 'open-junk-file)
(global-set-key (kbd "C-x C-z") 'open-junk-file) ;; C-x C-zで試行錯誤用のファイルを開く


;;; Others

(savehist-mode t)            ;; 履歴を保存 
(setq backup-inhibited t)    ;; バックアップファイル作成無効
(setq make-backup-files nil) ;; バックアップファイル*.~作成無効化
(setq auto-save-default nil) ;; バックアップファイル.#*無効化

;; 自動保存
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 1) ; 指定のアイドル秒で保存
(auto-save-buffers-enhanced t)

;; indent
(setq c-tab-always-indent t)        ;; TABはつねに現在行の 字下げをやり直す
(setq-default indent-tabs-mode nil) ;; インデントをタブでなく空白で(バッファ毎に設定可能)
(setq indent-line-function 'indent-relative-maybe)  ;; 前と同じ行の幅にインデント

;; session
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; resentf
(require 'recentf-ext)
(setq recentf-max-saved-items 3000)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Notabs (https://www.emacswiki.org/emacs/NoTabs)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2) ;; タブは空白2文字で表示する

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; kbd
(define-key global-map (kbd "C-c o") 'goto-line)
(define-key global-map [?¥] [?\\])  ;; ¥の代わりに\を入力する

;; 文字コード
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; スタートアップ画面非表示
(setq inhibit-startup-message t)

;; ジェネリックモード有効化
(require 'generic-x)

;; PATH from $SHELL
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
  This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell
         (replace-regexp-in-string "[ \t\n]*$" ""
                                   (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path-from-shell-PATH)
