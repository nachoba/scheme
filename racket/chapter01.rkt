#lang racket

(define (area-of-disk r)
  (* 3.14 (* r r)))

(define (area-of-ring out in)
  (- (area-of-disk out)
     (area-of-disk in)))

(define (fahrenheit->celsius f)
  (/ (- f 32) (/ 5 9)))
