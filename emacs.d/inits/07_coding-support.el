;;; 07_coding-support.el --- general coding support setting

;; Copyright (C) 2012  Takuma Goto

;; Author: Takuma Goto
;; Keywords: 

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

;;; Code:

(which-func-mode 1)

;; 全てのメジャーモードに対してwhich-func-modeを適用する
(setq which-func-modes t)

;; 画面上部に表示する
(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(setq-default header-line-format '(which-func-mode ("" which-func-format)))

(provide '07_coding-support)
;;; 07_coding-support.el ends here
