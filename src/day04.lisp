(defpackage advent.day04
  (:use :cl :advent :split-sequence))
(in-package :advent.day04)


(defun parse-grid (lines)
  (let ((grid
          (make-array (list (length lines) (length (car lines))))))
    (loop for line in lines
          for row from 0
          do (loop for char across line
                   for col from 0
                   do (setf (aref grid row col) char)))
    grid))

(defun gen-coords (row col max-row max-col)
  (flet ((in-bounds-p (r c)
           (and (>= r 0) (>= c 0)
                (<= r max-row) (<= c max-col))))
    (let ((directions
            '((0 1) ;right
              (0 -1) ;left
              (-1 0) ;up
              (1 0) ; down
              (-1 1) ; NE
              (-1 -1) ;  NW
              (1 1) ;SE
              (1 -1)))); SW
      (remove nil
              (loop for (dr dc) in directions
                    for line = (loop for step from 0 to 3
                                     collect (list (+ row (* step dr))
                                                   (+ col (* step dc))))
                    when (every (lambda (coord)
                                  (in-bounds-p (first coord) (second coord)))
                                line)
                      collect line)))))

(defun get-word (arr coords)
  (map 'string (lambda (coord)
                 (apply #'aref arr coord))
       coords))

(defun get-words-count (arr coords-list)
  (loop for coords in coords-list
        for word = (get-word arr coords)
        when (equal word "XMAS")
          counting word))

(defun day04-part1 (lines)
  (let* ((grid (parse-grid lines))
         (max-row (1- (first (array-dimensions grid))))
         (max-col (1- (second (array-dimensions grid)))))
    (loop for row from 0 to max-row
          summing (loop for col from 0 to max-col
                        when (eq (aref grid row col) #\X)
                          summing (get-words-count grid (gen-coords row col max-row max-col))))))

;; (day04-part1 (load-input-lines 4))

;;;;;; Part 2

(defun check-square (arr row col)
  (and
   (eq (aref arr (1+ row) (1+ col)) #\A)
   (or (and (eq (aref arr row col) #\M)
            (eq (aref arr (+ 2 row) (+ 2 col)) #\S))
       (and (eq (aref arr row col) #\S)
            (eq (aref arr (+ 2 row) (+ 2 col)) #\M)))
   (or (and (eq (aref arr row (+ 2 col)) #\M)
            (eq (aref arr (+ 2 row) col) #\S))
       (and (eq (aref arr row (+ 2 col)) #\S)
            (eq (aref arr (+ 2 row) col) #\M)))))

(defun day04-part2 (lines)
  (let* ((grid (parse-grid lines))
         (max-row (1- (first (array-dimensions grid))))
         (max-col (1- (second (array-dimensions grid)))))
    (loop for row from 0 to (- max-row 2)
          summing (loop for col from 0 to (- max-row 2)
                        counting (check-square grid row col)))))


(day04-part2 (load-input-lines 4))
                                        ; => 1965 (11 bits, #x7AD)
