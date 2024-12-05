(defpackage advent.day05
  (:use :cl :advent :split-sequence :arrow-macros))
(in-package :advent.day05)

(defun split-on-empty-line (s)
  (ppcre:split "\\n\\n" s))

(defun add-rule (rules left right)
  (push right (gethash left rules)))

(defun print-hash-table (h)
  (maphash (lambda (key value)
             (format t "~A:~T~A~%" key value))
           h))

(defun middle (l)
  (nth (floor (/ (length l) 2)) l))

(defun parse-ordering-rules (lines)
  (reduce (lambda (hash line)
            (ppcre:register-groups-bind
                (left right) ("(\\d+)\\|(\\d+)" line)
              (add-rule hash (parse-integer left) (parse-integer right)))
            hash)
          lines :initial-value (make-hash-table)))

(defun parse-page-numbers (lines)
  (->> lines
    (mapcar (lambda (line) (ppcre:split "," line)))
    (mapcar (lambda (line) (mapcar #'parse-integer line)))))

(defun parse-input (input)
  (destructuring-bind (rules-string pages-string) (split-on-empty-line input)
    (list
     (parse-ordering-rules (split-lines rules-string))
     (parse-page-numbers (split-lines pages-string)))))

(defun page-valid-p (rules left cur)
  (not (intersection left (gethash cur rules))))

(defun valid-page-order-p (rules printout)
  (let ((left nil))
    (loop for page in printout
          always (page-valid-p rules left page)
          do (push page left))))


(defun day05-part1 (input)
  (destructuring-bind (rules printouts) (parse-input input)
    (loop for printout in printouts
          when (valid-page-order-p rules printout)
            summing (middle printout))))

;; (day05-part1 (load-input 5))
