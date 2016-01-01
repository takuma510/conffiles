;;; 07_coding-support.el --- general coding support setting

;;; Code:


;; 全てのメジャーモードに対してwhich-func-modeを適用する
(which-func-mode 1)
(setq which-func-modes t)

;; 画面上部に表示する
(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(setq-default header-line-format '(which-func-mode ("" which-func-format)))

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; 07_coding-support.el ends here
