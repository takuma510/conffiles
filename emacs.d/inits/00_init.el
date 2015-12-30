
;;;; パッケージインストール

;;; package.el

;; Usage
;; M-x package-list-packages -> i(check install pkg), x(exec install)
(require 'package)

;; add package-archives server
(add-to-list 'package-archives
             '("melpa" .     "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; install pkg automatically (ref. http://qiita.com/catatsuy/items/5f1cd86e2522fd3384a0)
(require 'cl)
(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    slim-mode
    android-mode
    php-mode
    php-extras
    flymake
    flymake-php
    flymake-cursor
    flymake-easy
    flymake-python-pyflakes
    js2-mode
    tss
    ess
    magit
    haskell-mode
    actionscript-mode
    helm
    popup
    auto-complete
    tabbar
    viewer
    auto-save-buffers-enhanced
    session
    lispxmp
    dired-single
    markdown-mode
    yasnippet
    rbenv
    inf-ruby
    ruby-electric
    ruby-block
    robe
    paredit
    igrep
    open-junk-file
    recentf-ext
    py-autopep8
    elpy
    scala-mode2
    ensime
    go-mode
    go-autocomplete
    go-eldoc
    undo-tree
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))



;;; PATH from $SHELL

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)
