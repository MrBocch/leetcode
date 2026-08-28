(define/contract (can-make-arithmetic-progression arr)
  (-> (listof exact-integer?) boolean?)
  (define (sliding-window k xs)
    (define l (length xs))
    (cond
      [(> k l) (error "bork")]
      [(= k l) (list (take xs k))]
      [else
        (cons (take xs k) (sliding-window k (cdr xs)))]))
        
  (define (difference xs)
    (apply - xs))

  (define (all-eq? xs)
    (apply = xs))
    
	(all-eq? (map difference (sliding-window 2 (sort arr <)))))
