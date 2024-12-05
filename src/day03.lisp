(defpackage advent.day03
  (:use :cl :advent :split-sequence))
(in-package :advent.day03)

(defparameter lines (load-input-lines 3))
(defparameter input (load-input 3))

(defparameter mul-pattern "mul\\((\\d{1,3}),(\\d{1,3})\\)")

(defun find-groups (line)
  (ppcre:all-matches-as-strings mul-pattern line))


(defun day03-part1 (lines)
  (let ((sum 0))
    (dolist (line lines)
      (ppcre:do-register-groups (a b) (mul-pattern line)
        (setf sum (+ sum (* (parse-integer a) (parse-integer b))))))
    sum))

;;;; Part 2

(defun filter-valid-substrings (out in next)
  (case next
    (:do
     (multiple-value-bind (from to) (ppcre:scan "do\\(\\)" in)
       (if to
           (filter-valid-substrings out (subseq in to) :dont)
           out)))
    (:dont
     (multiple-value-bind (from to) (ppcre:scan "don't\\(\\)" in)
       (if from
           (filter-valid-substrings (concatenate 'string out (subseq in 0 from)) (subseq in from) :do)
           (concatenate 'string out in))))))

(defun day03-part2 (input)
  (day03-part1 (list (filter-valid-substrings "" input :dont))))
