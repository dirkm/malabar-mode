(require 'malabar-misc)
(require 'malabar-util)
(require 'malabar-variables)
(require 'malabar-reflection)

;; e.g http://java.sun.com/javase/6/docs/api/java/lang/String.html
;;     http://java.sun.com/javase/6/docs/api/java/lang/String.html#codePointAt%28int%29
(defcustom malabar-help-docset "http://java.sun.com/javase/6/docs/api"
  "The suffix of a test class."
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

;;(defun malabar-help-url-class-name-method (classname,methodname)
;;  (concat (malabar-help-url-class-name classname) ?# methodname))

(defun malabar-help-class ( unqualified )
  "Displays help for a class"
  (interactive (list (read-from-minibuffer "Class: " (thing-at-point 'symbol))))
  (browse-url 
   (malabar-help-url-class-name (malabar-qualify-class-name-in-buffer unqualified ))))

;; (provide 'malabar-help)