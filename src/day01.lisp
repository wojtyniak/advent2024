(defpackage advent.day01
  (:use :cl :alexandria :serapeum :split-sequence :advent :arrow-macros)
  (:export #:parse-pair #:day01-part1))
(in-package :advent.day01)

(defparameter input (load-input-lines 1))

(defun parse-pair (pair)
  (mapcar #'parse-number pair))

(defun parse-line (line)
  (split-sequence #\Space line :remove-empty-subseqs t))

(parse-pair '("1" "2"))

(defun prepare-input (lines)
  (->> lines
    (mapcar #'parse-line)
    (mapcar (lambda (l) (mapcar #'parse-number l)))
    (apply #'mapcar #'list)
    (mapcar (lambda (s) (sort s #'<)))))



(defun day01-part1 (lines)
  (destructuring-bind (left right) (prepare-input lines)
    (reduce #'+ (mapcar (lambda (a b) (abs (- a b))) left right))))


;; (->> lines
;;   (mapcar #'parse-line)
;;   (mapcar (lambda (l) (mapcar #'parse-number l)))
;;   (apply #'mapcar #'list)))


;; (defun extract-lists (lines)
;;   (let ((pairs-str (mapcar (lambda (line) (split-sequence #\Space line :remove-empty-subseqs t)) lines))
;;         (pairs (mapcar (lambda)))
;;         (left nil)
;;         (right nil))))

;; (defun day01-part1 (input) nil)
