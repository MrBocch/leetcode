(define/contract (max-alternating-sum nums)
  (-> (listof exact-integer?) exact-integer?)
  (let* (
    [forwards (sort (map (lambda [x] (expt x 2)) nums) >)]
    [len (length nums)]
    [n (+ (quotient len 2) (modulo len 2))]
    [forward  (take forwards n)]
    [backward (drop forwards n)])

    (- (apply + forward) (apply + backward))))
