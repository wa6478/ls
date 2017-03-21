# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

# Examples

def bubble_sort!(array)
  loop do
    idx1 = 0
    idx2 = idx1 + 1
    
    loop do
      a = array[idx1]
      b = array[idx2]

      return array if b == nil

      if a > b
        array[idx1] = b
        array[idx2] = a
        idx1 = 0
        idx2 = idx1 + 1
      else
        idx1 += 1
        idx2 = idx1 + 1
      end
    end
  end
end

# worked on first try... feel pretty good about that, ha!
# refactor with swap idiom var1, var2 = var2, var1

def bubble_sort!(array)
  loop do
    first = 0
    second = 1
    
    loop do
      return array if array[second] == nil

      if array[first] > array[second]
        array[first], array[second] = array[second], array[first]
        first = 0
        second = 1
      else
        first += 1
        second = first + 1

      end
    end
  end
end

# actually not a proper bubble sort because I don't pass all the way through every time there is a swap

def bubble_sort!(array)
  loop do
    first = 0
    second = 1
    swapped = false

    loop do
      break if array[second] == nil

      if array[first] > array[second]
        array[first], array[second] = array[second], array[first]
        swapped = true
      end

      first += 1
      second = first + 1
    end

    return array if swapped == false
  end
end

# only using one index

def bubble_sort!(array)
  loop do
    idx = 0
    swapped = false

    loop do
      break if array[idx + 1] == nil

      if array[idx] > array[idx + 1]
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        swapped = true
      end
      
      idx += 1
    end

    return array if swapped == false
  end
end



array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)