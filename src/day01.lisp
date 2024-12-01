(defpackage advent.day01
  (:use :cl :alexandria :split-sequence :arrow-macros :advent)
  (:export #:parse-pair #:day01-part1))
(in-package :advent.day01)

(defparameter input (load-input-lines 1))

(defun parse-pair (pair)
  (mapcar #'parse-integer pair))

(defun parse-line (line)
  (split-sequence #\Space line :remove-empty-subseqs t))

(defun prepare-input (lines)
  (->> lines
    (mapcar #'parse-line)
    (mapcar (lambda (l) (mapcar #'parse-integer l)))
    (apply #'mapcar #'list)
    (mapcar (lambda (s) (sort s #'<)))))



(defun day01-part1 (lines)
  (destructuring-bind (left right) (prepare-input lines)
    (reduce #'+ (mapcar (lambda (a b) (abs (- a b))) left right))))

;;; Part 2

(defun num-freq (nums)
  (reduce
   (lambda (h n)
     (let ((val (gethash n h 0)))
       (setf (gethash n h 0) (+ 1 val))
       h))
   nums :initial-value (make-hash-table)))

(defun day01-part2 (lines)
  (destructuring-bind (left right) (prepare-input lines)
    (let ((freq (num-freq right)))
      ;; (princ (hash-table-alist freq))
      (reduce
       (lambda (s x)
         ;; (princ (gethash x freq 0))
         ;; (format t "~A: ~A~%" x (gethash x freq 0))
         (+ s (* x (gethash x freq 0))))
       left
       :initial-value 0))))


