
;;;; scala-mode

(require 'scala-mode-auto)


;;; ENSIME(ENhanced Scala Interaction Mode for Emacs)

(add-to-list 'load-path "~/.emacs.d/manual-install/ensime_2.9.2-0.9.8.1/elisp/")
(require 'ensime)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
