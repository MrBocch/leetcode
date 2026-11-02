(define/contract (min-moves2 nums)
  (-> (listof exact-integer?) exact-integer?)
  (define snums (sort nums <))
  (define nth (quotient (length nums) 2))
  (define (abs-diff x y) (abs (- x y)))
  (define (sum xs) (foldl + 0 xs))
  (define (sub-scalar x xs) (map (lambda[y] (abs (- x y))) xs))
  (cond
    [(odd? (length nums)) 
      (define median (list-ref snums nth))
      (sum (sub-scalar median nums))]
    [else
      (define median1 (list-ref snums nth))
      (define median2 (list-ref snums (sub1 nth)))
      (min (sum (sub-scalar median1 nums))
           (sum (sub-scalar median2 nums)))]))