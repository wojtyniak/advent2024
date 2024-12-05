(defpackage :advent/tests.day03
  (:use :cl :fiveam :advent/tests)
  (:shadowing-import-from :advent.day03
                          #:mul-pattern))
;; #:day03-part1
;; #:day03-part2

(in-package :advent/tests.day03)
(defvar ex1 "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))")


(def-suite* day03 :in advent)
(in-suite* day03)
