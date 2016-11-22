fibStore := Map clone
fib := method(n, 
  if(n <= 2, 
    1, 
    if(fibStore at(n asString), 
      fibStore at(n asString), 
      fibStore atPut(n asString, fib(n-1) + fib(n-2)); fibStore at(n asString)
    )
  )
)

fib(System args at(1) asNumber) println