
;;;; android minor mode

(require 'android-mode)



;; コマンド用プレフィックス
;; ここで設定したキーバインド＋android-mode.elで設定された文字で
;; 各種機能を利用できます
(setq android-mode-key-prefix (kbd "C-c C-c"))


;; Android SDKのパス
(setq android-mode-sdk-dir (getenv "ANDROID_SDK_ROOT"))


;; デフォルトで起動するエミュレータ名
(setq android-mode-avd "android-17")
