
;;;; 画面表示の設定


;;; フレーム

;; メニューバー、ツールバー、スクロールバーを消す
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; フレームタイトルをファイルパスに
(setq frame-title-format (format "%%f - Emacs @%s" (system-name)))


;; モードラインの改行コード
(setq eol-mnemonic-unix "(EOL Unix)")
(setq eol-mnemonic-dos  "(EOL Dos)")
(setq eol-mnemonic-mac  "(EOL Mac)")



;;; ウィンドウ

(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))

;; Ctrl-c R でウィンドウリサイズモード・hjklでリサイズ
(global-set-key "\C-cR" 'window-resizer)



;;; 画面分割

;; "C-=" (C-S--), "C-|"で画面分割
(global-set-key (kbd "C-=") 'split-window-vertically)
(global-set-key (kbd "C-|") 'split-window-horizontally)

;; "C-S-hjkl"でウィンドウ移動
(global-set-key (kbd "C-S-h") 'windmove-left)
(global-set-key (kbd "C-S-j") 'windmove-down)
(global-set-key (kbd "C-S-k") 'windmove-up)
(global-set-key (kbd "C-S-l") 'windmove-right)



;;; モード行

;; 行番号・桁番号を表示
(line-number-mode t)
(column-number-mode t)



;;; 強調

;; 現在行をハイライト
(global-hl-line-mode t)
(defface my-hl-line-face
  '((((class color) (background dark))  ; カラーかつ, 背景が dark ならば
     (:background "DarkSlateBlue" t))   ; 背景を黒に.
    (((class color) (background light)) ; カラーかつ, 背景が light でも
     (:background "DarkSlateBlue" t))   ; 背景を黒に.
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)

;; 対応する括弧を表示させる
(show-paren-mode t)



;;; 初期化用自作関数 各環境毎の設定ファイルで呼ぶ

(defun my-start-gui-emacs ()
  ;; start server for emacsclient
  (require 'server)
  (unless (server-running-p)
    (server-start))

  ;; "C-x C-c"でサーバをkill
  (global-set-key (kbd "C-x C-c") 'server-edit)
  ;; "M-x exit"でemacsを終了
  (defalias 'exit 'save-buffers-kill-emacs)

  ;; GUIでの色付け
  (add-to-list 'default-frame-alist '(background-color . "black"))
  (add-to-list 'default-frame-alist '(foreground-color . "white")))

(defun my-start-cui-emacs ()
  ;; ターミナルでマウスを有効にする
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 5)))
  (global-set-key [mouse-5] '(lambda () (interactive) (scroll-up 5)))

  ;; CUIではdefault-frame-alistを使わないほうが良さげ
  (set-background-color "black"))


