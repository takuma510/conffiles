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


;;; Others

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Notabs (https://www.emacswiki.org/emacs/NoTabs)
(setq-default indent-tabs-mode nil)

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
