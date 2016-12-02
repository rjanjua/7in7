squareBrackets := method(
    call message arguments map(item, 
        if(item type == Message type, doMessage(item, item))
    )
)

[1,2,3,4,5] println
list(1,2,3,4,5) println
"" println

["", "hello", "is it me you're looking for"] println
list("", "hello", "is it me you're looking for") println
"" println

[] println
list() println
"" println

[1, "a"] println
list(1, "a") println
"" println

[1+2, Object clone, "aaabaaa" split("b")] println
list(1+2, Object clone, "aaabaaa" split("b")) println