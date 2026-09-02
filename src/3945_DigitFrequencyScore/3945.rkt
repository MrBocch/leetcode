(define/contract (digit-frequency-score n)
  (-> exact-integer? exact-integer?)
    (define (digits x)
      (define quot  (quotient x 10))
      (define digit (modulo   x 10))
      (cond
        [(= 0 quot) (list digit)]
        [else       (cons digit (digits quot))]))

    (apply + (digits n)))