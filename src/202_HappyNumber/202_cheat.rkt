(define/contract (is-happy n)
  (-> exact-integer? boolean?)
  (define (digits x)
    (define quot  (quotient x 10))
    (define digit (modulo   x 10))
    (cond
      [(= 0 quot) (list digit)]
      [else       (cons digit (digits quot))]))

  (define (sum-squares xs)
    (define (square x) (* x x))
    (apply + (map square xs)))

  (define (step n)
    (sum-squares (digits n)))

	(cond
		[(<= n 9) (or (= n 1) (= n 7))]
		[else
			(is-happy (step n))]))


