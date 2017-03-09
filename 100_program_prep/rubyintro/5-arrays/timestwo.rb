def timestwo(array)
  arrtwo = []
  array.each do |element|
    arrtwo << element * 2
  end
  p array
  p arrtwo
end

timestwo([5,10,12,13,14])