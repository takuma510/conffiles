
;;;;  js2-mode (installed by package.el)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq-default js2-basic-offset 2) ;; indent


;;; generate html5 project
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
