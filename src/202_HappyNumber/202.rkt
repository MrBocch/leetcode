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

	(define cache (mutable-set))
	(define (seen? n) (set-member? cache n))
	(define (loop n)
		(cond
			[(seen? n) (= n 1)]
			[else
				(set-add! cache n)
				(loop (step n))]))

	(loop n))


