(defpackage advent
  (:use :cl :alexandria :serapeum :split-sequence)
  (:export #:load-input #:load-input-lines))
(in-package :advent)

(defun load-input (day)
  (trim-whitespace (uiop:read-file-string (format nil "inputs/day~2,'0d.txt" day))))

(defun load-input-lines (day)
  (mapcar #'trim-whitespace (uiop:read-file-lines (format nil "inputs/day~2,'0d.txt" day))))
