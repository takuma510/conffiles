;;; 02_display.el -- display settings

;;; Commentary:

;;; Code:


(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode t)
(show-paren-mode t)
(global-linum-mode -1) ; 行番号表示

;; "C-=" (C-S--), "C-|"で画面分割
(global-set-key (kbd "C-=") 'split-window-vertically)
(global-set-key (kbd "C-|") 'split-window-horizontally)

;; https://github.com/abo-abo/ace-window
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?j ?k ?l ?i ?o ?h ?y ?u ?p))

;; 初期化用自作関数 各環境毎の設定ファイルで呼ぶ
(defun my-start-gui-emacs ()
  ;; start server for emacsclient
  (require 'server)
  (unless (server-running-p)
    (server-start))

  ;; "C-x C-c"でサーバをkill
  (global-set-key (kbd "C-x C-c") 'server-edit)
  ;; "M-x exit"でemacsを終了
  (defalias 'exit 'save-buffers-kill-emacs))

(defun my-start-cui-emacs ()
  ;; ターミナルでマウスを有効にする
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 5)))
  (global-set-key [mouse-5] '(lambda () (interactive) (scroll-up 5)))

  ;; CUIではdefault-frame-alistを使わないほうが良さげ
  (set-background-color "black"))


;;; 02_display.el ends here
