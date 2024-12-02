(defpackage :advent/tests.day02
  (:use :cl :fiveam :advent/tests)
  (:shadowing-import-from :advent.day02
                          #:day02-part1
                          #:day02-part2
                          #:parse-input
                          #:pair-valid
                          #:all-pairs
                          #:record-validp))

(in-package :advent/tests.day02)

(def-suite* day02 :in advent)
(in-suite* day02)

(defparameter day02-ex1 "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9")

(defparameter day02-ex1-parsed (parse-input (split-lines day02-ex1)))

(test parse-input
  (is (equal
       (parse-input '("1 2 3" "4 5 6"))
       '((1 2 3) (4 5 6)))))

(test day02-part1
  (is (= (day02-part1 day02-ex1-parsed) 2)))

(test day02-part2
  (is (= (day02-part2 day02-ex1-parsed) 4)))
