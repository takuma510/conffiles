
;;;;  org-mode

;; Emacs23以降
(if (>= emacs-major-version 23)
    (progn
      (require 'org)
      (org-remember-insinuate)                                                  ; org-rememberの初期化
      (setq org-directory "~/docs/")                                            ; メモを格納するorgファイルの設定
      (setq org-default-notes-file (expand-file-name "memo.org" org-directory)) ; メモファイル
      (setq org-remember-templates
            '(("Todo" ?t "** TODO %?\n   %i\n   %a\n   %t" nil "Inbox")
              ("Bug" ?b "** TODO %?   :bug:\n   %i\n   %a\n   %t" nil "Inbox")
              ("Idea" ?i "** %?\n   %i\n   %a\n   %t" nil "New Ideas")
              ))
      (global-set-key (kbd "M-m") 'org-remember)

      ;; 要らないkey-bindingを無効化
      (define-key org-mode-map [C-S-left]  nil)
      (define-key org-mode-map [C-S-right] nil)
      (define-key org-mode-map (kbd "C-,") nil)
      (define-key org-mode-map [S-up]    nil)
      (define-key org-mode-map [S-down]  nil)
      (define-key org-mode-map [S-left]  nil)
      (define-key org-mode-map [S-right] nil)

      ;; TODO管理
      (setq org-use-fast-todo-selection t)
      (setq org-todo-keywords
            '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "CANCEL(c)")
              (sequence "APPT(a)" "|" "DONE(x)" "CANCEL(c)")))

      ;; 予定表
      (setq org-default-notes-file "~/docs/memo.org") ; M-x org-remember によるメモを集めるorgファイル
      (setq org-agenda-files (list org-default-notes-file)) ; 予定表に使うorgファイルのリスト
      (global-set-key (kbd "C-c a") 'org-agenda) ; agenda閲覧
    )
)
