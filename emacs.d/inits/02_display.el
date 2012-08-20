;;
;; 画面表示の設定
;;
;=======================================================================
; 画面分割
;=======================================================================
;; "C-=" (C-S--), "C-|"で画面分割
(global-set-key (kbd "C-=") 'split-window-vertically)
(global-set-key (kbd "C-|") 'split-window-horizontally)

;; "C-S-hjkl"でウィンドウ移動
(global-set-key (kbd "C-S-h") 'windmove-left)
(global-set-key (kbd "C-S-j") 'windmove-down)
(global-set-key (kbd "C-S-k") 'windmove-up)
(global-set-key (kbd "C-S-l") 'windmove-right)


;=======================================================================
; 全体
;=======================================================================
;; メニューバー、ツールバー、スクロールバーを消す, Emacs23以降
(if (>= emacs-major-version 23)
    (progn
      (tool-bar-mode nil)
      (scroll-bar-mode nil)
      (menu-bar-mode nil)
    )
)


;=======================================================================
; モード行
;=======================================================================
;; 行番号・桁番号を表示
(line-number-mode t)
(column-number-mode t)


;=======================================================================
; 強調
;=======================================================================
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
