
;;;; scala settings

(require 'scala-mode2)

;; ENSIME StartGuide is https://github.com/ensime/ensime-server/wiki/Quick-Start-Guide

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
