;;; 03_eww.el --- emacs web browser settings

;;; Commentary:

;; my eww settings

;;; Code:


;; Search Engine
(setq eww-search-prefix "http://www.google.co.jp/search?q=") ;; default is duckduckgo


;; Colorize
(defvar eww-disable-colorize t)
(defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
  (unless eww-disable-colorize
    (funcall orig start end fg)))
(advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
(advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)
(defun eww-disable-color ()
  "Disable color on eww."
  (interactive)
  (setq-local eww-disable-colorize t)
  (eww-reload))
(defun eww-enable-color ()
  "Enable color on eww."
  (interactive)
  (setq-local eww-disable-colorize nil)
  (eww-reload))


;; Images
(defun eww-disable-images ()
  "Disable images on eww."
  (interactive)
  (setq-local shr-put-image-function 'shr-put-image-alt)
  (eww-reload))
(defun eww-enable-images ()
  "Enable images on eww."
  (interactive)
  (setq-local shr-put-image-function 'shr-put-image)
  (eww-reload))
(defun shr-put-image-alt (spec alt &optional flags)
  (insert alt))
(defun eww-mode-hook--disable-image ()
  (setq-local shr-put-image-function 'shr-put-image-alt))
(add-hook 'eww-mode-hook 'eww-mode-hook--disable-image)


;; Enable multi eww buffers
(defun eww-mode-hook--rename-buffer ()
  "Rename eww browser's buffer so sites open in new page."
  (rename-buffer "eww" t))
(add-hook 'eww-mode-hook 'eww-mode-hook--rename-buffer)


;; Make easy to search
(defun eww-search (term)
  (interactive "sSearch terms: ")
  (defvar eww-hl-search-word term)
  (eww-browse-url (concat eww-search-prefix term)))
(add-hook 'eww-after-render-hook
          (lambda ()
            (highlight-regexp eww-hl-search-word)
            (defvar eww-hl-search-word nil)))


;;; 03_eww.el ends here
