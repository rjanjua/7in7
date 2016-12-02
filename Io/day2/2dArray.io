List ofSize := method(n, val, 
 arr := list()
 n repeat(arr push(val))
)

TwoDimensionalArray := List clone

TwoDimensionalArray addZeroRow := method(n, 
  push(list ofSize(n, 0))
)

TwoDimensionalArray addRow := method(
  row,
  push(row)
)

TwoDimensionalArray addRows := method(x,y, y repeat(addZeroRow(x)); self)

TwoDimensionalArray set := method(x,y,value, at(y) atPut(x, value); self)

TwoDimensionalArray get := method(x,y,value, at(y) at(x))

TwoDimensionalArray dimensions := method(
  m := Map clone
  m atPut("x", at(0) size)
  m atPut("y", size)
  m asObject
)

TwoDimensionalArray transpose := method(
  transposed := TwoDimensionalArray clone addRows(dimensions y, dimensions x)
  foreach(newX, row,
    row foreach(newY, item,
      transposed set(newX, newY, item)
    )
  )
  transposed
)

TwoDimensionalArray asSequence := method(
  reduce(
    all, 
    line,
    all .. (line reduce (x,y, x .. " " .. y )) .. "\n",
    ""
  )
)

TwoDimensionalArray fromSequence := method(seq,
  seq split("\n") reduce(
    matrixToReturn,
    line,
    addRow( line split(" ") ),
    clone 
  )
)

TwoDimensionalArray println := method(
  asSequence .. "\n" print
)

dim := method(x,y, 
  TwoDimensionalArray clone addRows(x,y)
)

// checking it works
"a couple of 2d arrays:" println
dim(2,1) println
dim(2,2) println
"" println
"get and set the location of M: " println
m_arr := dim(7,9) set(1,7, "M")
m_arr println
m_arr get(1,7) println
"" println
"transpose: " println
tenByTwo := dim(10,2) set(0,1,"X") set(0,0, "Y") set(9,1, "Z")
"" println
tenByTwo println
tenByTwo transpose println
