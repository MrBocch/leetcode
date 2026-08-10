(define/contract (detect-capital-use word)
  (-> string? boolean?)
  (define (all-up? s)
	  (string=? (string-upcase s)
	            s))

  (define (all-down? s)
    (string=? (string-downcase s)
	            s))

  ; could use string-titlecase
  (define (is-capitalized? s)
    (and (all-up?   (substring s 0 1))
	       (all-down? (substring s 1))))

  (or (all-up? word)
      (all-down? word)
      (is-capitalized? word)))
