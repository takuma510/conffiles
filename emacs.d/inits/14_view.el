;;; 14_view.el -- view-mode settings

;;; Commentary:

;;; Code:


(setq view-read-only t) ; C-x C-r でview-modeでファイルを開く

;; knd
(require 'view)
(define-key view-mode-map (kbd "/") 'isearch-forward)
(define-key view-mode-map (kbd "G") 'end-of-buffer)
(define-key view-mode-map (kbd "h") 'backward-char)
(define-key view-mode-map (kbd "j") 'next-line)
(define-key view-mode-map (kbd "k") 'previous-line)
(define-key view-mode-map (kbd "l") 'forward-char)
(global-set-key (kbd "C-c v") 'view-mode)

(require 'viewer)
;; 書き込み不能なファイルではviewer-modeから抜けない
(viewer-stay-in-setup)


;; モードラインに色をつける
(setq viewer-modeline-color-unwritable "tomato")
(setq viewer-modeline-color-view "orange")
(viewer-change-modeline-color-setup)


;;; 14_view.el ends here
