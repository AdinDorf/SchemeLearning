;Assignment 5
;Written by Adin Dorf
;4/30/2020

;Practice Functions
(define run1
  (lambda () (- (+ 3 5) 7) )
  )
(define run2
  (lambda () (- (* 2 (+ (+ 8 5) 4)) 25))
  )
(define run3
  (lambda () (- 10 (+ (* 3 5) (+ 2 (* 0 5)))))
  )
(define run4
  (lambda () (* 5 (+ 4 (/ (+ (+ 10 10) (* 5 8)) (+ 10 2)))))
  )
(define run5 
  (lambda () (+ (/ (- (/ (/ (* (+ 3 5) (+ 6 4)) 2) 2) 5) 3) (+ (/ (+ (* 2 10) (* 5 4)) 2) (* 4 5))))
  )

;Recursive Multiply Functions
(define either-zero?
  (lambda (x y)
    (or (eqv? x 0) (eqv? y 0)))
  )
(define same-sign?
  (lambda (x y)
    (or (and (> x 0) (> y 0)) (and (< x 0) (< y 0))))
  )
(define pos-result-multiply
  (lambda(x y)
    (if (eqv? y 1)
        x
        (+ x (pos-result-multiply x (- y 1)))))
  );done using if

(define neg-result-multiply
  (lambda(x y)
    (cond ((eqv? y 0) 0)
          (else (- (neg-result-multiply x (- y 1))x)))
  ));done using cond

(define recursive-multiply
  (lambda (x y)
    (cond ((either-zero? x y) 0)
          ((same-sign? x y) (pos-result-multiply (abs x) (abs y)))
          (else (neg-result-multiply (abs x) (abs y))))
    ))

(define ReadAndMult
  (lambda ()
    (display "Please enter two numbers to multiply: ")
    (recursive-multiply (read) (read))
    ))

;Sum list functions
(define number-list?
  (lambda (x)
    (or (null? x)
        (and (number? (car x))
             (number-list? (cdr x))))
    ))

;I really hope apply is allowed here...
(define sum-number-list
  (lambda (x)
    (if (number-list? x)
        (apply + x)
        #f)
    ))
                   
                         
                  