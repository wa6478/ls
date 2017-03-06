   arr = ["b", "a"]
   arr = arr.product(Array(1..3))
   p arr
   arr.first.delete(arr.first.last)

   arr = ["b", "a"]
   arr = arr.product([Array(1..3)])
   p arr
   arr.first.delete(arr.first.last)