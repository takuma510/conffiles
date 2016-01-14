
;;;; Cocoa-emacs画面表示の設定

;;; 初期化

(my-start-gui-emacs)

(run-with-idle-timer 0.5 nil 'toggle-frame-fullscreen)

(load-theme 'tango-dark t)
