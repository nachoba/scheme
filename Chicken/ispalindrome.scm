;; A function that checks whether the argument is a palindrome
(define (palindrome? x)
  (define (check left right)
    (if (>= left right)
	#t
	(and (char=? (string-ref x left) (string-ref x right))
	     (check (add1 left) (sub1 right)))))
  (check 0 (sub1 (string-length x))))
(let ((arg (car (command-line-arguments))))
  (display
   (string-append arg
		  (if (palindrome? arg)
		      " is a palindrome\n"
		      " is not a palindrome\n"))))

;; Compile with:
;; >$ csc -o ispalindrome ispalindrome.scm

