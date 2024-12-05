(defpackage :advent/tests.day04
  (:use :cl :fiveam :advent/tests)
  (:shadowing-import-from
   :advent.day04
   #:gen-coords
   #:parse-grid
   #:get-word
   #:get-words-count
   #:day04-part1
   #:day04-part2

   :split-sequence
   #:split-sequence))

(in-package :advent/tests.day04)

(defparameter ex1 "MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX")

(defparameter ex1-lines (split-sequence #\Newline ex1))

(def-suite* day04 :in advent)
(in-suite* day04)
