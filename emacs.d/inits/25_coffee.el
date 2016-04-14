;;; 25_emmet.el --- coffee-mode settings

;;; Commentary:

;;; Code:


(autoload 'coffee-mode
  "coffee-mode" "Major mode for editing CoffeeScript." t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(custom-set-variables '(coffee-tab-width 2))


;;; 25_coffee.el ends here
