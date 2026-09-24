(define/contract (smallest-index nums)
  (-> (listof exact-integer?) exact-integer?)
  (let* ([sums (map sum-digs nums)]
         [ziped (zip-with = sums (range (length nums)))])
    (or (index-of ziped #t) -1)))

(define (sum xs) (foldl + 0 xs))

(define (digits x)
  (define quot  (quotient x 10))
  (define digit (modulo   x 10))
  (cond
    [(= 0 quot) (list digit)]
    [else       (cons digit (digits quot))]))

(define (sum-digs x)
  (sum (digits x)))

(define (zip-with f xs ys)
  (cond
    [(or (empty? xs) (empty? ys)) '()]
    [else
      (cons (f (car xs) (car ys))
            (zip-with f (cdr xs) (cdr ys)))]))