(define/contract (count-commas n)
  (-> exact-integer? exact-integer?)

  (max 0 (- n 999)))