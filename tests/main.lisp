(defpackage advent/tests
  (:use :cl :advent :fiveam :split-sequence)
  (:export advent))
(in-package :advent/tests)


;; NOTE: To run this test file, execute `(asdf:test-system :advent)' in your Lisp.
(def-suite* advent)
(def-suite* main :in advent)
(in-suite main)

(test foo-test
  (is (= (+ 1 1) 2)))
