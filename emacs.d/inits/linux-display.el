
;;;; Linux画面表示の設定

;;; 初期化

(if (eq window-system 'x)
    (progn ;; GUI
      (my-start-gui-emacs)

      (add-to-list 'default-frame-alist '(cursor-color . "white"))
      (set-face-background 'region "Blue")

      ;; fullscreen
      (defun toggle-fullscreen (&optional f)
	(interactive)
	(let ((current-value (frame-parameter nil 'fullscreen)))
	  (set-frame-parameter nil 'fullscreen
			       (if (equal 'fullboth current-value)
				   (if (boundp 'old-fullscreen) old-fullscreen nil)
				 (progn (setq old-fullscreen current-value) 'fullboth)
                                 )
			       )
          )
        )
      (global-set-key [f11] 'toggle-fullscreen)

      ;; maximize window (X Window System-specific implementation)
      (defun toggle-maximize (&optional f)
	(interactive)
	(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			       '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
	(x-send-client-message nil 0 nil "_NET_WM_STATE" 32
			       '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
        )
      (global-set-key (kbd "C-x RET RET") 'toggle-maximize)
      ;; 起動時に最大化して分割、少し間を置かないとレイアウトがおかしくなる
      (defun my-maximize-and-split ()
	(interactive)
	(toggle-maximize)
	(split-window-horizontally)
        )
      (run-with-idle-timer 0.5 nil 'my-maximize-and-split)
      )
  (progn ;; CUI
    (my-start-cui-emacs)
    (add-to-list 'default-frame-alist '(foreground-color . "brightwhite"))
    (add-to-list 'default-frame-alist '(cursor-color . "brightwhite"))
    )
  )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background nil :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "Dejavu Sans Mono")))))

