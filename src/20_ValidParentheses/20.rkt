(define/contract (is-valid s)
  (-> string? boolean?)
  (define (valid? opening closing)
    (match (list opening closing)
      [(list #\( #\)) #t]
      [(list #\{ #\}) #t]
      [(list #\[ #\]) #t]
      [_ #f]))

  (define (opening? c)
    (or (char=? c #\( )
        (char=? c #\[ )
        (char=? c #\{ )))

  (define (is-valid-iter xs stack)
    (cond
      [(empty? xs) (empty? stack)]
      [else
        (define c (car xs))
        (cond 
          [(opening? c) (is-valid-iter (cdr xs) (cons c stack))]
          [else 
            (cond
              [(empty? stack) #f]
              [(valid? (car stack) c) (is-valid-iter (cdr xs) (cdr stack))]
              [else #f])])]))

  (is-valid-iter (string->list s) '()))
