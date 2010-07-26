;;; malabar-help.el 
;;
;; Copyright (c) 2010 Dirk Moermans <dirkmoermans@gmail.com>
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
;; 02110-1301 USA.
;;

;; this file tries to mimick jde-help and is largely based on it

;; This file is not part of GNU Emacs.

(require 'malabar-misc)
(require 'malabar-util)
(require 'malabar-variables)
(require 'malabar-reflection)

;; e.g http://java.sun.com/javase/6/docs/api/java/lang/String.html
;;     http://java.sun.com/javase/6/docs/api/java/lang/String.html#codePointAt%28int%29

(defcustom malabar-help-docset "http://java.sun.com/javase/6/docs/api"
  "The url to load java documentation from. This can be local and remote"
  :group 'malabar-mode
  :type 'string)

(defun malabar-help-append-file-name (filename)
  (format "%s%s%s"
          malabar-help-docset
          (if (string-equal "/" (substring malabar-help-docset -1))
              "" "/")
          filename))

(defun malabar-help-url-class-name (classname)
  (malabar-help-append-file-name
   (concat (substitute ?/ ?. classname) ".html")))

(defun malabar-help-class ( unqualified )
  "Displays help for a class"
  (interactive (list (read-from-minibuffer "Class: " (thing-at-point 'symbol))))
  (browse-url 
   (malabar-help-url-class-name (malabar-qualify-class-name-in-buffer unqualified ))))

(provide 'malabar-help)
