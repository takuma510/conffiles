;; package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless (package-installed-p 'counsel)
    (package-refresh-contents)
    (package-install 'counsel))
(unless (package-installed-p 'ace-window)
    (package-refresh-contents)
    (package-install 'ace-window))

;; org
(require 'org)
(require 'org-install)
(require 'org-capture)
(setq org-directory "~/docs/")
(setq org-default-notes-file
      (expand-file-name "memo.org" org-directory))
(setq org-gtd-directory (concat org-directory "gtd/"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/docs/gtd/action.org" "Inbox")
         "** TODO %?\n %i\n %a\n %t")
        ("i" "Idea" entry (file+headline "~/docs/gtd/inbox.org" "New Ideas")
         "** %?\n %i\n %a\n %t")
        ("c" "Schedule" entry (file+headline "~/docs/gtd/ical.org" "Schedule")
         "** TODO %?\n\t")))
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c s") 'org-insert-subheading)
(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "CANCEL(c)")
        (sequence "APPT(a)" "|" "DONE(x)" "CANCEL(c)")))
;;; 予定表
;; 予定表に組み込まれるorgファイルのリスト
(setq org-agenda-files
      (list org-default-notes-file
            org-gtd-directory))
(global-set-key (kbd "C-c a") 'org-agenda)

;; agenda閲覧前のwindow状態をそのまま使う
;; ref (http://stackoverflow.com/questions/10635989/emacs-org-agenda-list-destroy-my-windows-splits)
(setq org-agenda-window-setup 'current-window)

;;; speed-commands
(setq org-use-speed-commands t)

;;; 要らないkey-bindingを無効化
(define-key org-mode-map [C-S-left]  nil)
(define-key org-mode-map [C-S-right] nil)
(define-key org-mode-map (kbd "C-,") nil)
(define-key org-mode-map [S-up]    nil)
(define-key org-mode-map [S-down]  nil)
(define-key org-mode-map [S-left]  nil)
(define-key org-mode-map [S-right] nil)


;;; 00_global.el -- global settings
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

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets) ; filename<dir>形式
(setq uniquify-ignore-buffers-re "*[^*]+*") ; *で囲まれたファイル名は対象外

;; indent
(setq c-tab-always-indent t)        ; TABはつねに現在行の 字下げをやり直す
(setq-default indent-tabs-mode nil) ; インデントをタブでなく空白で(バッファ毎に設定可能)
(setq indent-line-function 'indent-relative-maybe)  ; 前と同じ行の幅にインデント

;; 文字コード
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; ruby
(setq ruby-insert-encoding-magic-comment nil) ; Disable encoding magic comment

;; 02_display.el -- display settings
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode t)
(show-paren-mode t)
(global-linum-mode -1) ; 行番号表示
(global-set-key (kbd "C-=") 'split-window-vertically)
(global-set-key (kbd "C-|") 'split-window-horizontally)
;; ace
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?j ?k ?l ?i ?o ?h ?y ?u ?p))

;; for cocoa emacs
(defun my-start-gui-emacs ()
  ;; start server for emacsclient
  (require 'server)
  (unless (server-running-p)
    (server-start))

  ;; "C-x C-c"でサーバをkill
  (global-set-key (kbd "C-x C-c") 'server-edit)
  ;; "M-x exit"でemacsを終了
  (defalias 'exit 'save-buffers-kill-emacs))
(my-start-gui-emacs)
(run-with-idle-timer 0.5 nil 'toggle-frame-maximized)
(load-theme 'tango-dark t)

;; swap command and option keys
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; counsel
(ivy-mode 1) ;; デフォルトの入力補完がivyになる
(counsel-mode 1)
;; M-x, C-x C-fなどのEmacsの基本的な組み込みコマンドをivy版にリマップする
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-;") 'counsel-recentf)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-c l") 'counsel-locate)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(ace-window counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
