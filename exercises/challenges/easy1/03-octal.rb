# base conversion
# take each number from the left times the base, add it to the next number, times the base
# add the last digit

# multiplying our working number by the base, then adding the next number in the sequence, repeat:

# class Octal
#   def initialize(octal_num)
#     @octal_num = valid_octal?(octal_num) ? octal_num : '0'
#   end

#   def to_decimal
#     working_number = 0
#     @octal_num.chars.map(&:to_i).each do |digit|
#       working_number *= 8
#       working_number += digit
#     end
#     working_number
#   end

#   def valid_octal?(num)
#     num =~ /[^0-7]/ ? false : true
#   end
# end

# taking each digit from the right and multiplying it by the base^position and summing them:

class Octal
  BASE = 8

  def initialize(octal_num)
    @octal_num = octal_num =~ /[^0-7]/ ? '0' : octal_num
  end

  def to_decimal
    decimal = 0
    @octal_num.reverse.chars.each.with_index do |num, idx|
      decimal += (num.to_i * BASE**idx)
    end
    decimal
  end
end
