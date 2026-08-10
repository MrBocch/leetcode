
(define/contract (prefixes-div-by5 nums)
  (-> (listof exact-integer?) (listof boolean?))
  ; scuffed scanl
  (define (scanl f init nums)
    (cond
      [(empty? nums) '()]
      [else
        (cons (f init (car nums))
              (scanl f (f init (car nums)) (cdr nums)))]))
  
  (define (div5? n)
    (= 0 (modulo n 5)))

  (define (shift1+b a b)
    (+ b 
       (arithmetic-shift a 1)))

  (map div5? 
    (scanl shift1+b 0 nums)))