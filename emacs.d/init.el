
;;;; init


;;; Add load-path

(add-to-list 'load-path "~/.emacs.d/manual-install")


;;; Install packages

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
    js2-mode
    tss
    ess
    magit
    haskell-mode
    helm
    helm-git-grep
    helm-gtags
    popup
    auto-complete
    viewer
    auto-save-buffers-enhanced
    session
    lispxmp
    dired-single
    markdown-mode
    yasnippet
    helm-c-yasnippet
    rbenv
    inf-ruby
    ruby-electric
    ruby-block
    robe
    paredit
    igrep
    open-junk-file
    recentf-ext
    elpy
    scala-mode2
    ensime
    go-mode
    go-eldoc
    undo-tree
    init-loader
    elixir-mode
    elixir-yasnippets
    flymake-elixir
    alchemist
    flycheck
    dayone
    elscreen
    elscreen-persist
    company
    company-quickhelp
    minitest
    rust-mode
    web-mode
    jdee
    emmet-mode
    exec-path-from-shell
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))


;;; Load init-loader path

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
