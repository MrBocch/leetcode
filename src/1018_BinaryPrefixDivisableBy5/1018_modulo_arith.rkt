
(define/contract (prefixes-div-by5 nums)
  (-> (listof exact-integer?) (listof boolean?))
  ; scuffed scanl
  (define (scanl f init nums)
    (cond
      [(empty? nums) '()]
      [else
        (cons (f init (car nums))
              (scanl f (f init (car nums)) (cdr nums)))]))
  
  (define (=0? n)
    (= n 0))

  (define (shift1+b a b)
    (modulo (+ b (arithmetic-shift a 1))
            5))

  (map =0? 
    (scanl shift1+b 0 nums)))