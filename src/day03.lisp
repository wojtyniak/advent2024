(defpackage advent.day03
  (:use :cl :advent :split-sequence))
(in-package :advent.day03)

(defparameter mul-pattern "mul\\((\\d{1,3}),(\\d{1,3})\\)")

(defun find-groups (line)
  (ppcre:all-matches-as-strings mul-pattern line))



(defun day03-part1 (lines)
  (let ((sum 0))
    (dolist (line lines)
      (ppcre:do-register-groups (a b) (mul-pattern line)
        (setf sum (+ sum (* (parse-integer a) (parse-integer b))))))))
