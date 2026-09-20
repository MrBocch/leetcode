(define/contract (furthest-distance-from-origin moves)
  (-> string? exact-integer?)
  (define cmoves (string->list moves))
  (define l-count (count =L? cmoves))
  (define r-count (count =R? cmoves))
  (define _-count (count =_? cmoves))

  (- (+ _-count (max l-count r-count)) 
     (min l-count r-count)))

(define (=L? c) (char=? #\L c))
(define (=R? c) (char=? #\R c))
(define (=_? c) (char=? #\_ c))
