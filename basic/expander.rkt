#lang br/quicklang
(define-macro (b-line NUM STATEMENT ...)
  (with-pattern ([LINE-NUM (prefix-id "line-" #'NUM
                                      #:source #'NUM)])
    (syntax/loc caller-stx
      (define (LINE-NUM) (void) STATEMENT ...))))

(define-macro (b-module-begin (b-program LINE ...))
  (with-pattern
      ([((b-line NUM STATEMENT ...) ...) #'(LINE ...)]
       [(LINE-FUNC ...) (prefix-id "line-" #'(NUM ...))])
    #'(#%module-begin
       LINE ...
       (define line-table
         (apply hasheqv (append (list NUM LINE-FUNC) ...)))
       (void (run line-table)))))
(provide (rename-out [b-module-begin #%module-begin]))

(define (run line-table)
  (define line-vec
    (list->vector (sort (hash-keys line-table) <)))
  (for/fold ([line-idx 0])
            ([i (in-naturals)]
             #:break (>= line-idx (vector-length line-vec)))
    (define line-num (vector-ref line-vec line-idx))
    (define line-func (hash-ref line-table line-num))
    (line-func)
    (add1 line-idx)))
