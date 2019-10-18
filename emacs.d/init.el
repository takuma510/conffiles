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
    lsp-mode
    lsp-ui
    company-lsp
    ace-window
    slim-mode
    js2-mode
    typescript-mode
    ess
    magit
    counsel
    popup
    viewer
    auto-save-buffers-enhanced
    session
    lispxmp
    dired-single
    markdown-mode
    yasnippet
    inf-ruby
    ruby-electric
    ruby-block
    paredit
    igrep
    open-junk-file
    recentf-ext
    go-mode
    go-eldoc
    undo-tree
    init-loader
    flycheck
    company
    company-quickhelp
    company-tern
    minitest
    web-mode
    emmet-mode
    exec-path-from-shell
    rainbow-mode
    scss-mode
    yaml-mode
    neotree
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
