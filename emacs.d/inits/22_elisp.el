;;; 22_elisp.el --- emacs lisp mode

;; Copyright (C) 2012  後藤 拓馬

;; Author: Takuma Goto
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; lispxmp

(require 'lispxmp)

;; C-c C-dと押すと註釈される
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)



;;; ParEdit

(require 'paredit)

;; hooks
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)



;;; auto-complete

(defun add-sources-to-ac-source ()
  (add-to-list 'ac-sources 'ac-source-symbols))
(add-hook 'emacs-lisp-mode-hook 'add-sources-to-ac-source)



(provide '22_elisp)
;;; 22_elisp.el ends here
