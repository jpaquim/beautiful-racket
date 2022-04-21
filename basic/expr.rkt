#lang br
(provide b-expr b-sum b-product b-neg b-expt)

(define (b-expr expr)
  (if (integer? expr) (inexact->exact expr) expr))

(define-macro-cases b-sum
  [(_ VAL) #'VAL]
  [(_ LEFT "+" RIGHT) #'(+ LEFT RIGHT)]
  [(_ LEFT "-" RIGHT) #'(- LEFT RIGHT)])

(define-macro-cases b-product
  [(_ VAL) #'VAL]
  [(_ LEFT "*" RIGHT) #'(* LEFT RIGHT)]
  [(_ LEFT "/" RIGHT) #'(/ LEFT RIGHT 1.0)]
  [(_ LEFT "mod" RIGHT) #'(modulo LEFT RIGHT)])

(define-macro-cases b-neg
  [(_ VAL) #'VAL]
  [(_ "-" VAL) #'(- VAL)])

(define-macro-cases b-expt
  [(_ VAL) #'VAL]
  [(_ LEFT "^" RIGHT) #'(expt LEFT RIGHT)])

#;(define-cases b-sum
    [(_ arg) arg]
    [(_ left op right) ((case op
                          [("+") +]
                          [("-") -]) left right)])

#;(define-cases b-product
    [(_ arg) arg]
    [(_ left op right) ((case op
                          [("*") *]
                          [("/") (λ (l r) (/ l r 1.0))]
                          [("mod") modulo]) left right)])

#;(define-cases b-neg
    [(_ val) val]
    [(_ _ val) (- val)])

#;(define-cases b-expt
    [(_ val) val]
    [(_ left _ right) (expt left right)])
