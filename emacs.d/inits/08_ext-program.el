;;; 08_ext-program.el --- external program

;; Copyright (C) 2012  後藤 拓馬

;; Author: 後藤 拓馬
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


;; for m-x shell-command
(setq shell-file-name "/bin/zsh")

;; for m-x shell
(setq explicit-shell-file-name "/bin/zsh")

(provide '08_ext-program)
;;; 08_ext-program.el ends here
