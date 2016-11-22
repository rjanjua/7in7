fibonacci := method(n, 
  i := 1;
  last_sum := 0;
  sum := 1;
  next_sum := 0;
  while(i < n, 
    next_sum = last_sum + sum;
    last_sum = sum;
    sum = next_sum;
    i = i+1;
    sum
  )
)

fibonacci(System args at(1) asNumber) println