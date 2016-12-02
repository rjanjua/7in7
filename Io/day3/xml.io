Builder := Object clone

Builder indent := ""
Builder deepen := method(self indent := indent .. "  ")
Builder undeepen := method( (self indent == "") ifTrue(return) ifFalse( self indent := self indent inclusiveSlice(2)) )
Builder forward := method(

    writeln(self indent, "<", call message name, ">");

    deepen;

    call message arguments foreach(
        arg,
        arg appendArg(message(0))
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(self indent .. content))
    );

    undeepen;

    writeln(self indent,"</", call message name, ">")
)
Builder ul( 
    li("Io" ),
    li("Lua" ), 
    li("JavaScript" )
)