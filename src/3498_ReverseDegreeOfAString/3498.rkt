(define/contract (reverse-degree s)
  (-> string? exact-integer?)
  (apply + 
    (map (lambda (xs) (apply * xs))
      (zip-with-index 1
        (map (lambda (x) (modulo (- 27 (- (char->integer x) 96)) 27))
          (string->list s))))))


(define (zip-with-index n xs)
  (cond
    [(empty? xs) '()]
    [else
      (cons (list (car xs) n)
            (zip-with-index (+ 1 n) (cdr xs)))])) 
