
(define/contract (result-array nums)
  (-> (listof exact-integer?) (listof exact-integer?))
  (creates-lists (cddr nums) 
                 (list (car nums)) 
                 (list (cadr nums))))

(define (creates-lists nums arr1 arr2)
  ;; assumes arr1 and arr2 are not empty
	(cond
    [(empty? nums)
      (append (reverse arr1) (reverse arr2))]
    [(> (car arr1) (car arr2))
		 	(creates-lists (cdr nums) (cons (car nums) arr1) arr2)]
    [else
			(creates-lists (cdr nums) arr1 (cons (car nums) arr2))]))