
;;;; ruby-mode


;;; defaults

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))


;;; rbenv

(require 'rbenv)
(global-rbenv-mode)
(setq rbenv-installation-dir "/usr/local/var/rbenv")

(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
                       (getenv "HOME") "/.rbenv/bin:"
                       (getenv "PATH")))

(setq exec-path (cons
                 (concat (getenv "HOME") "/.rbenv/shims")
                 (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))




;;; ruby-electric

(require 'ruby-electric)


;;; inf-ruby

(require 'inf-ruby)

(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;; use pry insted of irb
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-eval-binding "Pry.toplevel_binding")
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)


;;; ruby-block

(require 'ruby-block)
(setq ruby-block-highlight-toggle t)



;;; robe

(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)



;;; flymake

(require 'flymake)

;; I don't like the default colors :)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)


;;; style

(setq ruby-deep-indent-paren-style nil)


;; アクセス修飾子のインデントを下げる
(push "public"    ruby-block-mid-keywords)
(push "protected" ruby-block-mid-keywords)
(push "private"   ruby-block-mid-keywords)
(setq ruby-block-mid-re (regexp-opt ruby-block-mid-keywords))
(setq ruby-negative
      (concat "^[ \t]*\\(\\(" ruby-block-mid-re "\\)\\>\\|"
              ruby-block-end-re "\\|}\\|\\]\\)"))




;;; ruby-mode-hook

(defun my-ruby-mode-hooks ()
  (ruby-electric-mode t)
  (ruby-block-mode t)
  (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
      (flymake-mode)))

(add-hook 'ruby-mode-hook 'my-ruby-mode-hooks)
