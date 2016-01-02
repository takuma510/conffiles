;;; 01_helm.el --- helm settings

;;; Commentary:

;;; Code:

(require 'helm)

;; ファイルリストの表示
(global-set-key (kbd "C-;") 'helm-recentf)
