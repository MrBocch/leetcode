(define/contract (minimum-deletions nums)
  (-> (listof exact-integer?) exact-integer?)
  (let* ([min-index (index-of-f < nums)]
         [max-index (index-of-f > nums)]
         [len (length nums)]

         [left-index (min min-index max-index)]
         [right-index (max min-index max-index)]

         [l-r-steps (+ (- len right-index) (+ left-index 1))]
         [l-l-steps (inc right-index)]
         [r-r-steps (- len left-index)])

    (min l-r-steps l-l-steps r-r-steps)))

(define (inc x) (+ x 1))

(define (index-of-f f xs)
  (define (iter xs n i cur-i)
    (cond
      [(empty? xs) i]
      [else
       (let* ([x (car xs)])
         (cond
           [(f n x) (iter (cdr xs) n i (inc cur-i))]
           [else (iter (cdr xs) x cur-i (inc cur-i))]))]))
  (iter (cdr xs) (car xs) 0 1))
