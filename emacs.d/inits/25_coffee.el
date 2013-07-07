
;;;;  coffee-mode


;; See more at: http://yohshiy.blog.fc2.com/blog-entry-165.html
;; install by elpa M-x list-packages -> coffee

(autoload 'coffee-mode
  "coffee-mode" "Major mode for editing CoffeeScript." t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
