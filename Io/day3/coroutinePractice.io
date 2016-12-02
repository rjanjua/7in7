a := Object clone
b := Object clone


x := 1 // x seems to be unique for each thread

double := method(x = x*2)
objectId := method(x)
a m := method(
    ("a0 " .. (call sender double)) println 
    ("a0 " .. (call sender x uniqueHexId)) println
    yield
    ("a1 " .. (call sender double))   println
    ("a0 " .. (call sender x uniqueHexId)) println
    yield
)

b n := method(
    yield
    ("b0 " .. (call sender double)) println 
    ("a0 " .. (call sender x uniqueHexId)) println
    yield
    ("b1 " .. (call sender double)) println
    ("a0 " .. (call sender x uniqueHexId)) println

)

a @@m; b @@n;

Coroutine currentCoroutine pause