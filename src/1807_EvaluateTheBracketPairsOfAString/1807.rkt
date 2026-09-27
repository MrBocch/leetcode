(define/contract (evaluate s knowledge)
  (-> string? (listof (listof string?)) string?)

  (define knowledge-map 
    (foldl (lambda [x hash]
      (let* ([k (first x)]
             [v (second x)])

        (hash-set hash k v)))
        (make-immutable-hash)
        knowledge))

  (define (replace-key key)
    (cond
      [(hash-has-key? knowledge-map key) (hash-ref knowledge-map key)]
      [else "?"]))
     
  (define (runner cs)
    (cond
      [(empty? cs) '()]
      [(char=? (car cs) #\()
        (let* ([pr (take-while (cdr cs) (lambda [c] (not (char=? c #\) ))))]
               [key (list->string (reverse (car pr)))]
               [v (replace-key key)])
            (append (string->list v) (runner (second pr))))]
      [else
        (cons (car cs) (runner (cdr cs)))]))

  (list->string (runner (string->list s))))

(define (take-while xs p?)
  (define (runner curr res)
    (cond
      [(empty? curr) (list res '())]
      [(p? (car curr)) (runner (cdr curr) (cons (car curr) res))]
      [else (list res (cdr curr))]))

  (runner xs '()))

  
