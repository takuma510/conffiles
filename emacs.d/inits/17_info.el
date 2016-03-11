;;; 17_info.el --- info settings

;;; Commentary:

;;; Code:


(require 'info)
(require 'info-look) ; (C-h S)

;; kbd
(define-key Info-mode-map (kbd "h") 'backward-char)
(define-key Info-mode-map (kbd "j") 'next-line)
(define-key Info-mode-map (kbd "k") 'previous-line)
(define-key Info-mode-map (kbd "l") 'forward-char)


;;; 17_info.el ends here
