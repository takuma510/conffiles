;; for m-x shell-command
(setq shell-file-name "/bin/zsh")

;; for m-x shell
(setq explicit-shell-file-name "/bin/zsh")

;; Open a current buffer in ATOM
(defun open-atom ()
  (interactive)
  (call-process
   "atom" nil nil nil buffer-file-name))
