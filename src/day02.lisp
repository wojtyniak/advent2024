(defpackage advent.day02
  (:use :cl :advent :split-sequence))
(in-package :advent.day02)

(defun parse-input (lines)
  (mapcar (lambda (line)
            (mapcar #'parse-integer (split-sequence #\Space line :remove-empty-subseqs t)))
          lines))

(defparameter input (parse-input (load-input-lines 2)))

(defun pair-valid (a b)
  (< (abs (- a b)) 4))

(defun all-pairs (record)
  (if (null (cdr record))
      t
      (and (pair-valid (car record) (cadr record))
           (all-pairs (cdr record)))))

(defun record-validp (record)
  (and
   (or (apply #'< record)
       (apply #'> record))
   (all-pairs record)))


(defun day02-part1 (records)
  (count-if-not #'null (mapcar #'record-validp records)))

;;; Part 2

(defun list-variants (l)
  (loop for i from 0 below (length l)
        collect (append (subseq l 0 i)
                        (subseq l (1+ i)))))

(defun record-validp-2 (record)
  (or (record-validp record)
      (some #'record-validp (list-variants record))))

(defun day02-part2 (records)
  (count-if-not #'null (mapcar #'record-validp-2 records)))
