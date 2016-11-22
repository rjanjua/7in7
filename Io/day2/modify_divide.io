Number division := Number getSlot("/")
Number / := method(n, 
  if(n==0, 
    0, 
    division(n)
  )
) 

"1/0: " print
(1/0) println
"1/2: " print
(1/2) println