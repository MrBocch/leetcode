(define/contract (min-moves nums)
  (-> (listof exact-integer?) exact-integer?)
  (let ([maxn (apply max nums)])
    (apply + (map (lambda [x] (- maxn x)) nums))))