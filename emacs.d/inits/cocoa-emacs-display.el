
;;;; Cocoa-emacs画面表示の設定

;;; 初期化

(my-start-gui-emacs)

(defun my-maximize-frame ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000)
  (split-window-horizontally))

(run-with-idle-timer 0.5 nil 'my-maximize-frame)

(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "apple" :family "Monaco")))))

(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0208
 '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
