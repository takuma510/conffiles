
;;;; Windows画面表示の設定

;;; 初期化

(defun set-font-on-windows ()
  (set-face-attribute 'default nil :family "ＭＳ ゴシック")
  (set-fontset-font "fontset-default"
                    'japanese-jisx0208
                    '("ＭＳ ゴシック" . "jisx0208-sjis")))

(if (eq system-type 'windows-nt) ;; GNU Emacs on Windows (GUI)
  (progn
    (set-font-on-windows)
    (add-to-list 'default-frame-alist '(background-color . "black"))

    ;; Windows用の最大化
    (defun my-maximize ()
      (interactive)
      (w32-send-sys-command #xf030))
    (run-with-idle-timer 0.2 nil 'my-maximize)

    ;; GUI用の初期化(server-startなど)
    (if (eq window-system 'w32)
      (progn
        (my-start-gui-emacs)))))

;; On Cygwin command-line (CUI)
(if (eq system-type 'cygwin)
  (progn
    (set-font-on-windows)
    (my-start-cui-emacs)))