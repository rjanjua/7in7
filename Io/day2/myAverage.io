List myAvg := method(reduce(x,sum,
  if(
    x type=="Number" and sum type == "Number",
    sum+x,
    Exception raise("#{x} or #{sum} is not a Number" interpolate))
) / size)

myList := list(1,2,3,4,5,6,7,8,9,10)

"myAvg: #{myList myAvg}" interpolate println
"average: #{myList average}" interpolate println

d := try(
  list(1,2,3,4,5,6,7, "c", 2) myAvg
)
d catch(Exception,
    d showStack println
)

e := try( 
  list("a", "b", "c") myAvg
) 
e catch(Exception,
  e showStack println
)

f := try(
  list("b", 1, 2) myAvg
)
f catch(Exception,
    f showStack println
)

