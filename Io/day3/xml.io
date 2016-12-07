OperatorTable addAssignOperator(":", "colon")

XMLNode := Object clone

XMLNode name := nil
XMLNode value := nil
XMLNode attributes := nil
XMLNode children := nil

XMLNode colon := method(
    if(self attributes == nil, self attributes := list)
    first := call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"") 
    second := call argAt(1)
    self attributes append(list append(first, second))
)

XMLNode curlyBrackets := method(
    call message arguments foreach(arg, 
        doString(arg code)
    )
)

XMLNode forward := method( 
    self name := call message name
    call message arguments foreach(
        arg,
        node := XMLNode clone
        if(arg code beginsWithSeq("curlyBrackets"), 
            self doMessage(arg),
            if(arg code beginsWithSeq("\""), 
                self value = arg, 
                node doMessage(arg)
                if(self children == nil, self children := list)
                self children append(node)
            )
        )
    )
    self
)

XMLNode println := method(
    depth := if( call argAt(0) == nil, 1, call sender doMessage(call argAt(0)))
    indent := "  " repeated(depth)
    (indent .. "<") print
    self name print

    if(self attributes != nil, 
      self attributes foreach(attributeTuple,
        " " print
        attributeTuple at(0) print
        "=" print
        attributeTuple at(1) print
    ))

    ">" println

    if(self value != nil, (indent .. "  " .. self value) println)
    
    if(self children != nil, self children foreach(child, child println(depth+1)))

    (indent .. "</" .. self name .. ">") println

)

XMLNode inspect := method(
    "" println
    ("name: " .. self name) println
    ("id: " .. self uniqueHexId) println
    "attributes: " println;
    self attributes? foreach(arg, ("  " .. arg) println)
    ("children size: " .. self children? size) println
    "children id: " println
    self children? foreach(child, ("  " .. child uniqueHexId) println)
    self children? foreach(child, child inspect)
)

lotrXML := XMLNode clone

lotrXML trilogy({"author" : "tolkien", "pages" : 1000}, 
    title("The Lord of the Rings"),
    book({"part" : 1}, 
        title("The Fellowship of The Ring")
    ),
    book({"part" : 2}, 
        title("The Two Towers")
    ),
    book({"part" : 3}, 
        title("The Return of The King")
    )
) 

lotrXML println
