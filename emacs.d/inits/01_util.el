
;;;; 便利機能の追加


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
    flymake-php
    js2-mode
    tss
    ess
    magit
    haskell-mode
    actionscript-mode
    helm
    auto-complete
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))



;;; helm

(require 'helm)

;; ファイルリストの表示
(global-set-key (kbd "C-;") 'helm-recentf)


;;; undo-tree

(add-to-list 'load-path "~/.emacs.d/vender/undo")
(require 'undo-tree)
(global-undo-tree-mode)


;;; key map

(define-key global-map [?¥] [?\\])  ;; ¥の代わりに\を入力する
