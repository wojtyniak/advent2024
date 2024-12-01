(defpackage :advent/tests.day01
  (:use :cl :alexandria :serapeum :fiveam :advent :advent.day01 :advent/tests)
  (:import-from :advent.day01 #:prepare-input))
(in-package :advent/tests.day01)

(def-suite* day01 :in advent)

(in-suite* day01)

(defparameter ex1 "3   4
4   3
2   5
1   3
3   9
3   3")

(defparameter ex1-lines (split-sequence #\Newline ex1))

(test test-parse-pair
  (is (equal (parse-pair '("1" "2")) '(1 2))))
