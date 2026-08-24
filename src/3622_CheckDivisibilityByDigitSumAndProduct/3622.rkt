(define/contract (check-divisibility n)
  (-> exact-integer? boolean?)

  (define (digits x)
    (define quot  (quotient x 10))
    (define digit (modulo   x 10))
    (cond
      [(= 0 quot) (list digit)]
      [else       (cons digit (digits quot))]))

  (define (divisable? x y)
    (zero? (modulo x y)))

	(define digs (digits n))
	(divisable? n 
              (+ (apply + digs) (apply * digs))))