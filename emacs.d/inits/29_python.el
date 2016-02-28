
;;;; python-mode
;; http://hamukazu.com/2014/12/05/setting-emacs-for-python/


;;; defaults

;; auto indent
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map (kbd "\C-m") 'newline-and-indent)
            (define-key python-mode-map (kbd "RET") 'newline-and-indent)))

;; autopep8 (pip install --user autopep8)
(add-hook 'before-save-hook 'py-autopep8-before-save)

;; elpy (pip install --user rope jedi) -> package install

;; flymake (pip install --user pyflakes)
(require 'tramp-cmds)
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
     ; Make sure it's not a remote buffer or flymake would not work
     (when (not (subsetp (list (current-buffer)) (tramp-list-remote-buffers)))
      (let* ((temp-file (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
             (local-file (file-relative-name
                          temp-file
                          (file-name-directory buffer-file-name))))
        (list "pyflakes" (list local-file)))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))
 
(add-hook 'python-mode-hook
          (lambda ()
            (flymake-mode t)))
