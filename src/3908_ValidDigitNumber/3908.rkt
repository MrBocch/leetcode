(define/contract (valid-digit n x)
  (-> exact-integer? exact-integer? boolean?)
  (define digs (reverse (digits n)))
  (define (=x? n) (= x n))

  (and (not (=x? (car digs)))
       (>= (count =x? digs) 1)))

(define (digits x)
  (define quot  (quotient x 10))
  (define digit (modulo   x 10))
  (cond
    [(= 0 quot) (list digit)]
    [else       (cons digit (digits quot))]))
