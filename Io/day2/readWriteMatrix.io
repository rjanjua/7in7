doFile("2dArray.io")

tenByTen := dim(10,10) set(0,0, "h") set(1,1, "e") set(2,2, "l") set(3,3, "l") set(4,4, "o")

theMatrix := File with("theMatrix.txt") 

theMatrix openForUpdating write(tenByTen asSequence) close

"Reading the matrix we just wrote to a file" println; "" println
TwoDimensionalArray fromSequence(theMatrix openForReading contents) println