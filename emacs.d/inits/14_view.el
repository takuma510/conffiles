
;;;;  view-mode


;; C-x C-r でview-modeでファイルを開く
(setq view-read-only t)


;; key-bind
(require 'view)
(define-key view-mode-map (kbd "/") 'isearch-forward)
(define-key view-mode-map (kbd "G") 'end-of-buffer)
(define-key view-mode-map (kbd "h") 'backward-char)
(define-key view-mode-map (kbd "j") 'next-line)
(define-key view-mode-map (kbd "k") 'previous-line)
(define-key view-mode-map (kbd "l") 'forward-char)


(require 'viewer)
;; 書き込み不能なファイルではviewer-modeから抜けない
(viewer-stay-in-setup)


;; モードラインに色をつける
(setq viewer-modeline-color-unwritable "tomato")
(setq viewer-modeline-color-view "orange")
(viewer-change-modeline-color-setup)
