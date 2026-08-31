(define/contract (left-right-difference nums)
  (-> (listof exact-integer?) (listof exact-integer?))
    (define xs (scanl + 0 nums))
    (define ys (scanr + 0 nums))
    
    (zip-with sub-abs xs ys))
 

(define (scanl f acc xs)
  (match xs
    [(list) xs]
    [(cons x xs)
      (cons acc (scanl f (f acc x) xs))]))

(define (scanr f acc xs)
  (reverse
    (scanl f acc (reverse xs))))

(define (zip-with f xs ys)
  (cond
    [(or (empty? xs) (empty? ys)) '()]
    [else
      (cons (f (car xs) (car ys))
            (zip-with f (cdr xs) (cdr ys)))]))

(define (sub-abs x y)
  (abs (- x y)))

