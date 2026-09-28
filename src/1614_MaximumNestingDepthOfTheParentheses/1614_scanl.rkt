 
(define/contract (max-depth s)
  (-> string? exact-integer?)

  (foldl max 0
    (scanl (string->list s)
            0
            (lambda [acc c]
              (match c
                [#\( (add1 acc)]
                [#\) (sub1 acc)]
                [_    acc])))))

(define (scanl nums init f)
  (cond
    [(empty? nums) '()]
    [else
      (cons (f init (car nums))
            (scanl (cdr nums) (f init (car nums)) f))]))

