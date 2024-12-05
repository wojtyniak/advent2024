(defpackage :advent/tests.day05
  (:use :cl :fiveam :advent :advent/tests)
  (:shadowing-import-from
   :advent.day05
   #:add-rule
   #:parse-ordering-rules
   #:parse-page-numbers
   #:print-hash-table
   #:parse-input
   #:page-valid-p
   #:valid-page-order-p
   #:day05-part1))
;; #:day05-part2

(in-package :advent/tests.day05)

(defun hash-table-equal-p (h1 h2)
  ;; (print-hash-table h1)
  ;; (print-hash-table h2)
  (and
   (= (hash-table-count h1) (hash-table-count h1))
   (loop for key being the hash-keys of h1
         always (and (gethash key h2)
                     (equalp (gethash key h1) (gethash key h2))))
   (loop for key being the hash-keys of h2
         always (and (gethash key h1)
                     (equalp (gethash key h1) (gethash key h2))))))

(defparameter ex1 "47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47")

(def-suite* day05 :in advent)
(in-suite* day05)

(test parse-ordering-rules
  (let ((rules-3 (subseq (ppcre:split "\\n" ex1) 0 3))
        (parsed-3 (make-hash-table)))
    (add-rule parsed-3 47 53)
    (add-rule parsed-3 97 13)
    (add-rule parsed-3 97 61)
    (is (hash-table-equal-p (parse-ordering-rules rules-3)
                            parsed-3))))

(test page-valid
  (destructuring-bind (rules printouts) (parse-input ex1)
    (is (page-valid-p rules '(75) 57))
    (is (not (page-valid-p rules '(29 18 33 13) 53)))))
