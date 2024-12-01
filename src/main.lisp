(defpackage advent
  (:use :cl :alexandria :serapeum))
(in-package :advent)

(defun load-input (day)
  (trim-whitespace (uiop:read-file-string (format nil "inputs/day~2,'0d.txt" day))))

;; blah blah blah.
