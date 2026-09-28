(define/contract (rotated-digits n)
  (-> exact-integer? exact-integer?)

  (define (invalid-digit? n)
    (or (= 3 n) (= 4 n) (= 7 n)))

  (define (mirrors-digit? n)
    (or (= 2 n) (= 5 n) (= 6 n) (= 9 n)))

  (define (valid? n)
    (define (digits-iter x mirror-count)
      (define quot  (quotient x 10))
      (define digit (modulo   x 10))
      (cond
        [(invalid-digit? digit) #f]
        [(mirrors-digit? digit) 
          (digits-iter quot (add1 mirror-count))] 
        [(= 0 quot) 
          (>= mirror-count 1)]
        [else 
          (digits-iter quot mirror-count)]))

    (digits-iter n 0))

  (count valid? (inclusive-range 1 n)))
