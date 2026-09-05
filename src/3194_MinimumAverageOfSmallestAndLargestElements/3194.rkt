(define/contract (minimum-average nums)
  (-> (listof exact-integer?) flonum?)
    (define snums (sort nums <))
    (/ (apply min (zip-with + snums (reverse snums)))
        2.0))


(define (zip-with f xs ys)
  (cond
    [(or (empty? xs) (empty? ys)) '()]
    [else
      (cons (f (car xs) (car ys))
            (zip-with f (cdr xs) (cdr ys)))]))
