thing := Object clone

thing longMethod := method(wait(5); 10)

futureResult := thing @longMethod

"do this first" println

writeln("blocking until I get the result: ", futureResult)