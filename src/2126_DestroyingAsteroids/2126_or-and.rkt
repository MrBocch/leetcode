(define/contract (asteroids-destroyed mass asteroids)
  (-> exact-integer? (listof exact-integer?) boolean?)
  (define (iter mass asteroids)
    (or (empty? asteroids)
        (and (>= mass (car asteroids))
             (iter (+ mass (car asteroids)) (cdr asteroids)))))

  (iter mass (sort asteroids <)))
      
