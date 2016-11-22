2dArray := list(
  list(1,2,3,4,5,6,7,8,9,10, "foo"),
  list(1,2,3,4,5,6,7,8,9,10, "bar")
)

"sum: " print
2dArray flatten select(item, (item type) == "Number") sum println