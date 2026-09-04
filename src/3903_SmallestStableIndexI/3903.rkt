(define/contract (first-stable-index nums k)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (define mi (running-foldr1 min nums))
  (define ma (running-foldl1 max nums))
  (define (<=k? x)
    (<= x k))

  (define stable-indexes 
    (indexes-where (zip-with - ma mi) <=k?))

  (cond
    [(empty? stable-indexes) -1]
    [else
      (apply min stable-indexes)]))

(define (running-foldl1 f xs)
  (define (running-foldl1-iter f xs acc)
    (cond
      [(empty? xs) (list)]
      [else
        (define y (f acc (car xs)))
        (cons y 
          (running-foldl1-iter f (cdr xs) y))]))
  (cons (car xs)
    (running-foldl1-iter f (cdr xs) (car xs))))


(define (running-foldr1 f xs)
  (reverse
    (running-foldl1 f (reverse xs))))

(define (zip-with f xs ys)
  (cond
    [(or (empty? xs) (empty? ys)) '()]
    [else
      (cons (f (car xs) (car ys))
            (zip-with f (cdr xs) (cdr ys)))]))

