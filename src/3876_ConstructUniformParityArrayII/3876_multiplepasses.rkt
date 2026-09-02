(define/contract (uniform-array nums1)
  (-> (listof exact-integer?) boolean?)
  (cond
    [(or (andmap even? nums1) (andmap odd? nums1)) #t]
    [else
      (define smallest-odd (apply min (filter odd? nums1)))
      (define smallest-even (apply min (filter even? nums1)))
      (>= (- smallest-even smallest-odd) 1)]))

   