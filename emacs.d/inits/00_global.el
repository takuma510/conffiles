;;; 00_global.el -- global settings

;;; Commentary:

;;; Code:

;;; undo-tree

(require 'undo-tree)
(global-undo-tree-mode)



;;; key map

(define-key global-map [?¥] [?\\])  ;; ¥の代わりに\を入力する



;;; kbd

(global-unset-key "\C-t")
(define-key global-map (kbd "C-c o") 'goto-line)



;;; 文字コード

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)



;;; スタートアップ画面非表示

(setq inhibit-startup-message t)



;;; ジェネリックモード有効化

(require 'generic-x)



;;; Elscreen

;; kbd
(setq elscreen-prefix-key (kbd "C-t"))
(elscreen-start)

;; settings
(setq elscreen-display-tab nil)

;; elscreen-persist
(require 'elscreen-persist)
(elscreen-persist-mode 1)



;;; PATH from $SHELL

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)
