;;; init.el --- init

;;; Commentary:

;;; Code:


;; Install packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(require 'cl)
(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    slim-mode
    android-mode
    php-mode
    php-extras
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
    inf-ruby
    ruby-electric
    ruby-block
    robe
    paredit
    igrep
    open-junk-file
    recentf-ext
    scala-mode2
    ensime
    go-mode
    go-eldoc
    undo-tree
    init-loader
    elixir-mode
    elixir-yasnippets
    alchemist
    flycheck
    dayone
    elscreen
    elscreen-persist
    company
    company-quickhelp
    company-tern
    minitest
    rust-mode
    web-mode
    jdee
    emmet-mode
    exec-path-from-shell
    rainbow-mode
    ))
(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))


;; Load init-loader path
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")


;;; init.el ends here
