;;; 05_elscreen.el --- elscreen settings             -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(require 'elscreen)

;; kbd
(global-unset-key "\C-t")
(setq elscreen-prefix-key (kbd "C-t"))
(elscreen-start)

;; settings
(setq elscreen-display-tab nil)

;; elscreen-persist
(require 'elscreen-persist)
(elscreen-persist-mode 1)


;;; 05_elscreen.el ends here
