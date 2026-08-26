
(define/contract (minimum-sum nums)
  (-> (listof exact-integer?) exact-integer?)
  (define (scanl f acc xs)
    (match xs
      [(list) (list acc)]
      [(cons x xs)
        (cons acc (scanl f (f acc x) xs))]))
  
  (define (scanl1 f xs)
    (match xs
      [(list) '()]
      [(cons x xs) (scanl f x xs)]))

  (define (scanr1 f xs)
    (reverse (scanl1 f (reverse xs))))
  
  (define (zip3 xs ys zs)
    (cond
      [(or (empty? xs) (empty? ys) (empty? zs)) (list)]
      [else
        (cons (list (car xs) (car ys) (car zs))
              (zip3 (cdr xs) (cdr ys) (cdr zs)))]))
  

  (define (zipper xs)
    (define leftmin (scanl1 min xs))
    (define rightmin (cddr (scanr1 min xs)))
      (zip3 leftmin (cdr xs) rightmin))
  
;; transduce, filter -> map -> reduce all in one go, no intermediate list.
  (define (transduce p f r acc xs)
    (define (transduce-iter acc xs)
      (match xs
        ['() acc]
        [(cons x xs) (if (p x)
		                 (transduce-iter (r acc (f x)) xs)
		                 (transduce-iter acc xs))]))
  
    (transduce-iter acc xs))

  (define (peak? trips)
    (define (peak3? x y z) (and (> y x) (> y z)))
    (apply peak3? trips))

  (define (sum xs) (apply + xs))
	(define (cmp x y)
		(cond
			[(= x -1)     y]
			[else (min x y)]))

  (transduce peak? sum cmp -1 (zipper nums)))
