(defun $dio_snf (a)
  ;; kannan bachem, as found in flint 2.4
  (destructuring-bind (m n) (array-dimensions a)
    (let ((d (min m n))
          (s (alexandria:copy-array a)))
      (loop for k below d do
           (let (col-done)
             (loop until col-done do
                  (loop for i from (1+ k) below m do
                       (block continue
                         (when (zerop (aref s (1- i) k))
                           (return-from continue))                         
                         (when (absequal (aref s i k) (aref s (1- i) k))
                           (if (= (aref s i k) (aref s (1- i) k))
                               (loop for j from k below n do
                                    (decf (aref s (1- i) j) (aref s i j)))
                               (loop for j from k below n do
                                    (incf (aref s (1- i) j) (aref s i j))))
                           (return-from continue))
                         (destructuring-bind (g u v) (xgcd (aref s i k) (aref s (1- i) k))
                           (let* ((r2g (/ (aref s (1- i) k) g))
                                  (r1g (/ (aref s i k) g)))
                             (loop for j from k below n do
                                  )
                             ))))))))))
