(define/contract (uniform-array nums1)
  (-> (listof exact-integer?) boolean?)
  (define (min-sim a b)
    (cond
      [(symbol? a) b]
      [(symbol? b) a]
      [else (min a b)])) ; we aren't properly catching both symbol case buts its ok
 
  (define min-odd 'unset)
  (define min-even 'unset)
  (for ([n nums1])
    (cond
      [(odd? n) (set! min-odd (min-sim min-odd n))]
      [(even? n) (set! min-even (min-sim min-even n))]))

    (or (eq? 'unset min-odd)
        (eq? 'unset min-even)
        (> (- min-even min-odd) 0)))




   
