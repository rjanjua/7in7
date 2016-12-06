OperatorTable addAssignOperator(":", "colon")

squareBrackets := method(
    l := list();
    call message arguments foreach(arg, l append(doMessage(arg)))
    l
)

curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
       r doMessage(arg)
    )
  r
)

Map colon := method(
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
       call evalArgAt(1))
)

jsonFile := doFile("generated.json") 

jsonFile foreach(k, v, 
    (k .. " : " print) 
    if( (v type == "Map") or (v type == "List"), v foreach(arg, arg println), v println)
)