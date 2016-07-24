;;; 24_js.el --- js settings

;;; Commentary:

;;; Code:

(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)) ; use as major mode
(setq-default js2-basic-offset 2)                       ; indent
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; tern
(add-hook 'js2-mode-hook 'tern-mode)
(add-to-list 'company-backends 'company-tern)

;; js2-jsx-mode
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

;; nodejs
(setq js2-include-node-externs t)

;; generate html5 project
(setq-default html5-project-directory "~/src/js")
(setq-default html5-template "~/.emacs.d/project-template/html5/")
(defun generate-html5-project (prj)
  (interactive "sInput Project Name:")
  (cd html5-project-directory)
  (cond ((file-directory-p prj)
         (message "Already created %S" prj))
        (t
         (copy-directory html5-template prj)
         (find-file prj)
         (message "Create %S project"
                 (concat html5-project-directory "/" prj)))))

(add-hook 'js2-mode-hook #'linum-on) ; Enable linum-mode


;;; 24_js.el ends here
