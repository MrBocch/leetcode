(define/contract (decode-ciphertext encodedText rows)
  (-> string? exact-integer? string?)
  (define cols (/ (string-length encodedText) rows))

  (define (index i j)
    (define idx (+ j (* i cols)))
	  (cond
      [(< (string-length encodedText) idx) #\space] ; so bad lol
		[else
		  (string-ref encodedText idx)]))

  (define (inc x) (+ 1 x))
    (define (loop resets i j)
	  (cond
	    [(and (= i 0) (= j cols)) '()]
		[(= i rows)
		  (loop (inc resets) 0 (inc resets))]
		[(= j cols)
		  (loop (inc resets) 0 (inc resets))]
		[else (cons (index i j)
			    (loop resets (inc i) (inc j)))]))

	(cond
    ;; not necesarry but goes from 150ms to 400ms if i dont early check for it	
    [(= 1 rows) encodedText] 
	  [else
	    (string-trim 
	      (list->string
		      (loop 0 0 0))
        #:left? #f
        #:right? #t)]))


	
