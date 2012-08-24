
;;;;  org-mode


(require 'org)

;;; org-remember

(global-set-key (kbd "M-m") 'org-remember) ; キーバインド
(org-remember-insinuate) ; 初期化

;; メモの格納場所
(setq org-directory "~/docs/")
(setq org-default-notes-file
      (expand-file-name "memo.org" org-directory))

;; テンプレート設定
(setq org-remember-templates
      '(("Todo" ?t "** TODO %?\n   %i\n   %a\n   %t" nil "Inbox")
	("Idea" ?i "** %?\n   %i\n   %a\n   %t" nil "New Ideas")))



;;; TODO管理

(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "CANCEL(c)")
	(sequence "APPT(a)" "|" "DONE(x)" "CANCEL(c)")))



;;; 予定表

;; 予定表に組み込まれるorgファイルのリスト
(setq org-agenda-files (list org-default-notes-file))

;; agenda閲覧
(global-set-key (kbd "C-c a") 'org-agenda)



;;; 要らないkey-bindingを無効化
(define-key org-mode-map [C-S-left]  nil)
(define-key org-mode-map [C-S-right] nil)
(define-key org-mode-map (kbd "C-,") nil)
(define-key org-mode-map [S-up]    nil)
(define-key org-mode-map [S-down]  nil)
(define-key org-mode-map [S-left]  nil)
(define-key org-mode-map [S-right] nil)