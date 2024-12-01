(defpackage advent
  (:use :cl :alexandria :serapeum :split-sequence)
  (:export #:load-input #:load-input-lines))
(in-package :advent)


(defun input-path (day)
  (asdf:system-relative-pathname "advent" (format nil "src/inputs/day~2,'0d.txt" day)))

(defun load-input (day)
  (trim-whitespace (uiop:read-file-string (input-path day))))

(defun load-input-lines (day)
  (mapcar #'trim-whitespace (uiop:read-file-lines (input-path day))))
