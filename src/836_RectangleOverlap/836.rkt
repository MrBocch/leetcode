(define/contract (is-rectangle-overlap rec1 rec2)
  (-> (listof exact-integer?) (listof exact-integer?) boolean?)
  (define ax1 (first rec1))
  (define ay1 (second rec1))
  (define ax2 (third rec1))
  (define ay2 (fourth rec1))

  (define bx1 (first rec2))
  (define by1 (second rec2))
  (define bx2 (third  rec2))
  (define by2 (fourth rec2))
  (define (not-overlaps? ap1 ap2 bp1 bp2)
    (define maxbp (max bp1 bp2))
    (define minbp (min bp1 bp2))
    (or (and (>= ap1 maxbp)
             (>= ap2 maxbp))
        (and (<= ap1 minbp)
             (<= ap2 minbp))))
  
  (not
    (or (not-overlaps? ax1 ax2 bx1 bx2)
        (not-overlaps? ay1 ay2 by1 by2))))


