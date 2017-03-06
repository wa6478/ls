#recusive zero


def zero(num)
  if num <= 0
    puts num
    return
  end

  puts(num)
  num -= 1
  zero(num)
end



puts "number please"
number = gets.chomp.to_i
zero(number)