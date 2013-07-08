
;;; package.el

;; Usage
;; M-x package-list-packages -> i(check install pkg), x(exec install)


(require 'package)

;; add package-archives server
(add-to-list 'package-archives '("melpa" .     "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)
