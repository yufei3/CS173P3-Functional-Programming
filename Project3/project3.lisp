(defun absolute (x)
	(if (>= x 0) 
		x 
		(- 0 x)))

(defun factorial (n)
	(cond 
		((= n 0) 1)
		(t (* n (factorial(- n 1))))))

(defun append (L1 L2)
	(if (null L1)
		L2
		(cons (car L1)
			(append (cdr L1) L2))))

(defun member (a S)
	(cond
		((null S) nil)
		((eq a (car S)) T)
		(T (member a (cdr S)))))
	
(defun reverse (L)
	(if (null L)
		nil
		(append (reverse (cdr L)) (cons (car L) '()))))

(defun gcd (p q)
  (cond
    ((= p q) p)
    ((< p q) (gcd p (- q p)))
    (t       (gcd q (- p q)))))

(defun lcm (p q)
	(/ (* p q) (gcd p q)))

(defun union (S1 S2)
	(cond 
		((null S1) S2)
		((member (car S1) S2)
			(union (cdr S1) S2))
		(T (cons (car S1) (union (cdr S1) S2)))))

(defun intersection (S1 S2)
	(if S1
		(if (member (car S1) S2)
			(cons (car S1) (intersection (cdr S1) S2))
			(intersection (cdr S1) S2))))

(defun insert (a S)
	(if (member a S) 
		S
		(cons a S)))

(defun add3 (x) (+ 3 x))
(defun map (function L)
	(if (null L)
		nil
		(cons (funcall function (car L)) (map function (cdr L)))))

(defun lessthan3 (x) (< x 3))
(defun filter (function L)
	(cond 
		((null L) nil)
		((funcall function (car L)) (cons (car L) (filter function (cdr L))))
		(t (filter function (cdr L)))
		))

(defun addtoend (a L)
	(reverse (cons a (reverse L))))

(defun mod1 (a b)
	(if (< a b) 
		a
		(mod1 (- a b) b)))

(defun perfect (x)
	(if (= (perfecthelp x 1 0) x)
		t
		nil))

(defun perfecthelp (x n total)
	(cond
		((= x n) total)
		((= (mod1 x n) 0) (perfecthelp x (+ n 1) (+ total n)))
		(t (perfecthelp x (+ n 1) total))))

(defun abundantp (x)
	(if (> (perfecthelp x 1 0) x)
		t
		nil))

(defun deficientp (x)
	(if (< (perfecthelp x 1 0) x)
		t
		nil))

(defun primep (x)
	(is_prime x 2)
)

(defun is_prime (x n)
	(if (< n x) 
		(if (= (mod1 x n) 0)
			nil
			(is_prime x (+ n 1)))
		t))

(defun nth-prime (x)
	(nth_prime_help x 2 0))

(defun nth_prime_help (x number index)
	(if (primep number)
		(if (= (- x index) 1)
			number
			(nth_prime_help x (+ number 1) (+ index 1))
		)
		(nth_prime_help x (+ number 1) index)))

(defun right-tri (x y z)
	(if (and (and (> (+ x y) z) (> (+ y z) x)) (> (+ x z) y))
		t
		nil))

(defun nth-fibo (x)
	(cond
		((= x 0) 0)
		((= x 1) 1)
		(t (+ (nth-fibo (- x 1)) (nth-fibo (- x 2))))
		))

(defun cardinality (S)
	(card S 0))

(defun card (S len)
	(if (null S)
		len
		(card (cdr S) (+ len 1))))

(defun subset (S1 S2)
	(cond 
		((null S1) t)
		((member (car S1) S2) (subset (cdr S1) S2))
		(t nil)
		))

(defun difference (S1 S2)
	(cond 
		((null S1) S1)
		((member (car S1) S2)
			(difference (cdr S1) S2))
		(T (cons (car S1) (difference (cdr S1) S2)))
		))

(defun superset (S1 S2)
	(cond
		((null S2) t)
		((member (car S2) S1) (superset S1 (cdr S2)))
		(t nil)
		))

(defun merge (L1 L2)
	(cond
		((null L1) L2)
		((null L2) L1)
		((< (car L1) (car L2)) (addtofront (car L1) (merge (cdr L1) L2)))
		((> (car L1) (car L2)) (addtofront (car L2) (merge L1 (cdr L2))))
		(t (addtofront (car L2) (merge L1 (cdr L2))))
		))

(defun addtofront (a L)
	(cons a L))

(defun indexof (a L)
	(indexhelper a L 0))

(defun indexhelper (a L index)
	(cond
		((null L) -1)
		((eq a (car L)) index)
		(t (indexhelper a (cdr L) (+ index 1)))))

(defun removeall (a L)
	(cond 
		((null L) L)
		((eq a (car L)) (removeall a (cdr L)))
		(t (cons (car L) (removeall a (cdr L))))))

(defun nub (L)
	(cond
		((null L) L)
		((duplicatehelper (car L) (cdr L)) (cons (car L) (nub (removeall (car L) L))))
		(t (cons (car L) (nub (cdr L))))))

(defun duplicatehelper (a L)
	(cond
		((null L) nil)
		((eq a (car L)) T)
		(T (duplicatehelper a (cdr L)))))

(defun symdiff (S1 S2)
	(sethelper (difference S1 S2) (difference S2 S1))
	)

(defun sethelper (S1 S2)
	(cond
		((null S1) S2)
		(t (cons (car S1) (sethelper (cdr S1) S2)))))

(defun powerset (S)
	(if (null S) '(())
		(add (car S) (powerset (cdr S)))))
(defun add (x pset)
	(if (null pset) 
		nil
		(cons (car pset) (cons (cons x (car pset)) (add x (cdr pset))))))

(defun loope()
	(print "Enter the index of function that you want to test (0 to quit): ")
	(print "")
	(setq number (read))

	(cond  
		((equal number 1) (print "Test APPEND function:")
						  (print "Enter list1")
						  (print "list1 finished")
						  (setq x (read))
						  (print "Enter list2")
						  (print "list2 finished")
						  (setq y (read))
						  (print "Output")
						  (print (append x y))
						  (terpri)
						  (loope)
						  )
		((equal number 2) (print "Test REVERSE function:")
						  (print "Enter list")
						  (print "list finished")
						  (setq x (read))
						  (print "Output")
						  (print (reverse x))
						  (loope)
						  )
		((equal number 3) (print "Test MAPPING function:")
						  (print "Enter function")
						  (print "function finished")
						  (setq x (read))
						  (print "Enter list")
						  (print "list finished")
						  (setq y (read))
						  (print "Output")
						  (print (map x y))
						  (loope)
						  )
		((equal number 4) (print "Test ADDTOEND function:")
			              (print "Enter an element")
			              (print "element finished")
			              (setq x (read))
			              (print "Enter list")
			              (print "list finished")
			              (setq y (read))
			              (print "Output")
			              (print (addtoend x y))
			              (loope)
			              )
		((equal number 5) (print "Test MEMBER function:")
			              (print "Enter an element")
			              (print "element finished")
			              (setq x (read))
			              (print "Enter Set (List)")
			              (print "set finished")
			              (setq y (read))
			              (print "Output")
			              (print (member x y))
			              (loope)
			)
		((equal number 6) (print "Test INSERT function:")
						  (print "Enter an element")
						  (print "element")
						  (setq x (read))
						  (print "Enter Set (List)")
						  (print "set")
						  (setq y (read))
						  (print "Output")
						  (print (insert x y))
						  (loope)
						  )
		((equal number 7) (print "Test INTERSECTION function:")
						  (print "Enter set1 (List)")
						  (print "set1")
						  (setq x (read))
						  (print "Enter set2 (List)")
						  (print "set2")
						  (setq y (read))
						  (print "Output")
						  (print (intersection x y))
						  (loope)
						  )
		((equal number 8) (print "Test UNION function:")
						  (print "Enter set1 (List)")
						  (print "set1")
						  (setq x (read))
						  (print "Enter set2 (List)")
						  (print "set2")
						  (setq y (read))
						  (print "Output")
						  (print (union x y))
						  (loope)
						  )
		((equal number 9) (print "Test ABSOLUTE function:")
						  (print "Enter an element")
						  (print "element")
						  (setq x (read))
						  (print "Output")
						  (print (absolute x))
						  (loope)
						  )
		((equal number 10) (print "Test FACTORIAL function:")
						  (print "Enter an element")
						  (print "element")
						  (setq x (read))
						  (print "Output")
						  (print (factorial x))
						  (loope)
						  )
		((equal number 11) (print "Test GCD function:")
						  (print "Enter an element")
						  (print "first element finished")
						  (setq x (read))
						  (print "Enter another element")
						  (print "second element finished")
						  (setq y (read))
						  (print "Output")
						  (print (gcd x y))
						  (loope)
						  )
		((equal number 12) (print "Test LCM function:")
						  (print "Enter an element")
						  (print "first element finished")
						  (setq x (read))
						  (print "Enter another element")
						  (print "second element finished")
						  (setq y (read))
						  (print "Output")
						  (print (lcm x y))
						  (loope)
						  )
		((equal number 13) (print "Test PERFECT function:")
						  (print "Enter an element")
						  (print "read element finished")
						  (setq x (read))
						  (print "Output")
						  (print (perfect x))
						  (loope)
						  )
		((equal number 14) (print "Test ABUNDANT function:")
						  (print "Enter an element")
						  (print "read element finished")
						  (setq x (read))
						  (print "Output")
						  (print (abundantp x))
						  (loope)
						  )
		((equal number 15) (print "Test DEFICIENT function:")
						  (print "Enter an element")
						  (print "read element finished")
						  (setq x (read))
						  (print "Output")
						  (print (deficientp x))
						  (loope)
						  )
		((equal number 16) (print "Test SUBSET function:")
						  (print "Enter set1 (List)")
						  (print "set1 finished")
						  (setq x (read))
						  (print "Enter set2 (List)")
						  (print "set2 finished")
						  (setq y (read))
						  (print "Output")
						  (print (subset x y))
						  (loope)
						  )
		((equal number 17) (print "Test PRIME function:")
						  (print "Enter an element")
						  (print "read element finished")
						  (setq x (read))
						  (print "Output")
						  (print (primep x))
						  (loope)
						  )
		((equal number 18) (print "Test NTH-PRIME function:")
						  (print "Enter an element")
						  (print "read element finished")
						  (setq x (read))
						  (print "Output")
						  (print (nth-prime x))
						  (loope)
						  )
		((equal number 19) (print "Test NTH-FIBO function:")
						  (print "Enter an element")
						  (print "read element finished")
						  (setq x (read))
						  (print "Output")
						  (print (nth-fibo x))
						  (loope)
						  )
		((equal number 20) (print "Test RIGHT-TRI function:")
						  (print "Enter first element")
						  (print "first element finished")
						  (setq x (read))
						  (print "Enter second element")
						  (print "second element finished")
						  (setq y (read))
						  (print "Enter third element")
						  (print "third element finished")
						  (setq z (read))
						  (print "Output")
						  (print (right-tri x y z))
						  (loope)
						  )
		((equal number 21) (print "Test CARDINALITY function:")
						  (print "Enter Set (List)")
						  (print "set finished")
						  (setq x (read))
						  (print "Output")
						  (print (cardinality x))
						  (loope)
						  )
		((equal number 22) (print "Test SUPERSET function:")
						  (print "Enter set1 (List)")
						  (print "read set1 finished")
						  (setq x (read))
						  (print "Enter set2 (List)")
						  (print "read set2 finished")
						  (setq y (read))
						  (print "Output")
						  (print (superset x y))
						  (loope)
						  )
		((equal number 23) (print "Test DIFFERENCE function:")
						  (print "Enter set1 (List)")
						  (print "read set1 finished")
						  (setq x (read))
						  (print "Enter set2 (List)")
						  (print "read set2 finished")
						  (setq y (read))
						  (print "Output") 
						  (print (difference x y))
						  (loope)
						  )
		((equal number 24) (print "Test MERGE function:")
						  (print "Enter list1")
						  (print "list1 finished")
						  (setq x (read))
						  (print "Enter list2")
						  (print "list2 finished")
						  (setq y (read))
						  (print "Output")
						  (print (merge x y))
						  (loope)
						  )
		((equal number 25) (print "Test INDEXOF function:")
						  (print "Enter an element")
						  (print "element finished")
						  (setq x (read))
						  (print "Enter a list")
						  (print "list finished")
						  (setq y (read))
						  (print "Output")
						  (print (indexof x y))
						  (loope)
						  )
		((equal number 26) (print "Test REMOVEALL function:")
						  (print "Enter an element")
						  (print "element finished")
						  (setq x (read))
						  (print "Enter a list")
						  (print "list finished")
						  (setq y (read))
						  (print "Output")
						  (print (removeall x y))
						  (loope)
						  )
		((equal number 27) (print "Test NUB function:")
						  (print "Enter a list")
						  (print "list finished")
						  (setq x (read))
						  (print "Output")
						  (print (nub x))
						  (loope)
						  )
		((equal number 28) (print "Test SYMDIFF function:")
						  (print "Enter set1 (List)")
						  (print "set1 finished")
						  (setq x (read))
						  (print "Enter set2 (List)")
						  (print "set2 finished")
						  (setq y (read))
						  (print "Output")
						  (print (symdiff x y))
						  (loope)
						  )
		((equal number 29) (print "Test FILTER function:")
						  (print "Enter function")
						  (print "function finished")
						  (setq x (read))
						  (print "Enter list")
						  (print "list finished")
						  (setq y (read))
						  (print "Output")
						  (print (filter x y))
						  (loope)
						  )
		((equal number 30) (print "Test POWERSET function:")
						  (print "Enter set (List)")
						  (print "set finished")
						  (setq x (read))
						  (print "Output")
						  (print (powerset x))
						  (loope)
						  )

		(t (print "Test finished"))
		))

(loope)



