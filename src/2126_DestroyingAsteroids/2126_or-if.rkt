(define/contract (asteroids-destroyed mass asteroids)
  (-> exact-integer? (listof exact-integer?) boolean?)
  (define (iter mass asteroids)
    (or (empty? asteroids) 
        (if (>= mass (car asteroids))
              [iter (+ mass (car asteroids)) (cdr asteroids)]
              #f)))

  (iter mass (sort asteroids <)))
      
