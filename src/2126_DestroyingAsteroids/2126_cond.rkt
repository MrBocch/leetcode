(define/contract (asteroids-destroyed mass asteroids)
  (-> exact-integer? (listof exact-integer?) boolean?)
  (define (iter mass aster)
    (cond
      [(empty? aster) #t]
      [else
        (cond
          [(< mass (first aster)) #f]
          [else
            (iter (+ mass (first aster)) (cdr aster))])]))

  (iter mass (sort asteroids <)))