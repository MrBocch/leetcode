(define/contract (sum-of-squares nums)
  (-> (listof exact-integer?) exact-integer?)
  (let* (
    [n        (length nums)]
    [xs       (zip-with-index 1 nums)]
    [filtered (filter (lambda [pair] (= 0 (modulo n (second pair)))) xs)]
    [mapped   (map    (lambda [pair] (expt (first pair) 2)) filtered)])

    (foldl + 0 mapped)))  

(define (zip-with-index n xs)
  (cond
    [(empty? xs) '()]
    [else
      (cons (list (car xs) n)
            (zip-with-index (+ 1 n) (cdr xs)))])) 