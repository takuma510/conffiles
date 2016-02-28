;;; 12_markdown.el -- markdown mode settings

;;; Commentary:

;;; Code:


(require 'markdown-mode)

;; default setting
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; open-atom
(define-key markdown-mode-map (kbd "C-o C-p") 'open-atom)


;;; 12_markdown.el ends here
