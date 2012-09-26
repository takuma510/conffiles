
;;;; ruby-mode


;;; rinari

(add-to-list 'load-path "~/.emacs.d/vender/rinari")
(require 'rinari)



;;; ruby-electric
;;; [description] 括弧などを自動挿入

(require 'ruby-electric)



;;; inf-ruby
;;; [description] emacsからirb

(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")



;;; ruby-block
;;; [description] endに対応する行のハイライト

(require 'ruby-block)
(setq ruby-block-highlight-toggle t)



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




;;; rsense

(setq rsense-home "~/.emacs.d/manual-install/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

(defun my-rsense-hooks ()
  ;; .や::を入力直後から補完開始
  (add-to-list 'ac-sources 'ac-source-rsense-method)
  (add-to-list 'ac-sources 'ac-source-rsense-constant)
  ;; C-x .で補完出来るようキーを設定
  (define-key ruby-mode-map (kbd "C-x .") 'ac-complete-rsense))



;;; ruby-mode-hook

(defun my-ruby-mode-hooks ()
  (my-rsense-hooks)
  (inf-ruby-keys)
  (ruby-electric-mode t)
  (ruby-block-mode t)
  (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
      (flymake-mode)))

(add-hook 'ruby-mode-hook 'my-ruby-mode-hooks)
