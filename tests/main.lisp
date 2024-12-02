(defpackage advent/tests
  (:use :cl :advent :fiveam :split-sequence)
  (:export advent :split-lines))
(in-package :advent/tests)


;; NOTE: To run this test file, execute `(asdf:test-system :advent)' in your Lisp.
(def-suite* advent)
(def-suite* main :in advent)
(in-suite main)

(defun split-lines (s)
  (split-sequence #\Newline s :remove-empty-subseqs t))

(test foo-test
  (is (= (+ 1 1) 2)))
