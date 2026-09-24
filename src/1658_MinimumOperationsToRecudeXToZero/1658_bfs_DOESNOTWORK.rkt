(struct node (left right sum) #:transparent)
 
(define/contract (min-operations nums x)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (define vxs (list->vector nums))
  (define (create-right-node n)
    (match n
      [(node l r s) (node l (sub1 r) (+ s (vector-ref vxs r)))]))

  (define (create-left-node n)
    (match n
      [(node l r s) (node (add1 l) r (+ s (vector-ref vxs l)))]))

  (define (dead-node? n)
    (match n
      [(node _ _ s) (> s x)]))
      
  (define (in-bounds? n)
    (match n [(node l r _)
      (and (< l (vector-length vxs))
           (> r 0))]))


  (define (ans-node? n)
    (match n
      [(node _ _ s) (= s x)]))

    
  (define (good-nodes n1 n2)
    (filter (lambda [n] (and (in-bounds? n) (not (dead-node? n)))) (list n1 n2)))


    (define (run-queue queue lvl idk)
    (cond
      [(and (empty? queue) (empty? idk)) -1]
      [(empty? queue) (run-queue idk (add1 lvl) '())]
      [else
        (define x (car queue))
        (match x [(node l r s)
          (define l-node (create-left-node x))
          (define r-node (create-right-node x))
          (cond
            [(or (ans-node? l-node) (ans-node? r-node)) lvl]
            [else (run-queue (cdr queue)
                             lvl
                             (append (good-nodes l-node r-node) idk))])])]))

  (define start-node (node 0 (sub1 (vector-length vxs)) 0))
  (run-queue (list start-node) 1 '()))

