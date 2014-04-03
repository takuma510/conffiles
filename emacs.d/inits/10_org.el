
;;;;  org-mode


(require 'org)



;;; org-capture

(require 'org-install)
(require 'org-capture)

;; メモの格納場所
(setq org-directory "~/docs/")
(setq org-default-notes-file
      (expand-file-name "memo.org" org-directory))

;; テンプレート
(setq org-gtd-directory (concat org-directory "gtd/"))
(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline
          (expand-file-name "action.org" org-gtd-directory)
          "Inbox")
         "** TODO %?\n %i\n %a\n %t")
        ("i" "Idea" entry
         (file+headline
          (expand-file-name "inbox.org" org-gtd-directory)
          "New Ideas")
         "** %?\n %i\n %a\n %t")))

;; キーバインド
(global-set-key (kbd "C-c c") 'org-capture)



;;; TODO管理

(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "CANCEL(c)")
        (sequence "APPT(a)" "|" "DONE(x)" "CANCEL(c)")))



;;; MobileOrg (iphone, android用クライアント)

;; Dropboxの同期用ディレクトリ
(setq org-mobile-directory "~/Dropbox/MobileOrg")

;; MobileOrgで新規作成したファイルの保存先
(setq org-mobile-inbox-for-pull
      (expand-file-name "mobile.org" org-directory))



;;; 予定表

;; 予定表に組み込まれるorgファイルのリスト
(setq org-agenda-files
      (list org-default-notes-file
            org-gtd-directory))

;; agenda閲覧
(global-set-key (kbd "C-c a") 'org-agenda)

;; agenda閲覧前のwindow状態をそのまま使う
;; ref (http://stackoverflow.com/questions/10635989/emacs-org-agenda-list-destroy-my-windows-splits)
(setq org-agenda-window-setup 'current-window)


;;; 要らないkey-bindingを無効化

(define-key org-mode-map [C-S-left]  nil)
(define-key org-mode-map [C-S-right] nil)
(define-key org-mode-map (kbd "C-,") nil)
(define-key org-mode-map [S-up]    nil)
(define-key org-mode-map [S-down]  nil)
(define-key org-mode-map [S-left]  nil)
(define-key org-mode-map [S-right] nil)


;;; work

(global-set-key (kbd "C-t w") 'my-todays-work)
(defun my-todays-work ()
  (interactive)
  (setq my-work-file "~/docs/work.org")
  (find-file my-work-file)
  (goto-char (point-max))
  (insert "** ")
  (my-insert-today))

(defun today ()
  (interactive)
  (my-insert-today))

(defun my-insert-today ()
  (insert (format-time-string "%Y-%m-%d")))
