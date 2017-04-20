# process
# read and understand the problem
# test cases
# take some preliminary notes (e.g. input, outputs, data structures, algo approaches)
# write some 'spike' like attempts
# then code once I know what I'm looking to do

# The Luhn formula is a simple checksum formula used to validate a variety of identification numbers
# The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number
# This number must pass the following test:
# Counting from rightmost digit (which is the check digit) and moving left, double the value of every second digit.
# For any digits that thus become 10 or more, subtract 9 from the result
# 1111 => 2121
#    ^
#   check
# 8763 => 7733
# add resulting digits together i.e. 2121 => 2 + 1 + 2 + 1 => 6
#                                    7733 => 7 + 7 + 3 + 3 => 20
# if result % 10 == 0, then valid, otherwise fales ()

# Write a program that, given a number:
# Can check if it is valid per the Luhn formula
# Can return the checksum
# Can add a check digit to make a number valid and return the original number plus that digit
require 'pry'

class Luhn
  attr_accessor :number

  def initialize(number)
    self.number = number
  end

  def addends
    reversed = number.to_s.reverse
    result = []
    reversed.chars.each.with_index do |char, idx|
      digit = char.to_i
      new_digit = idx.odd? ? (digit * 2 > 9 ? digit * 2 - 9 : digit * 2) : digit
      result.unshift(new_digit)
    end
    result
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(partial_number)
    10.times do |last_digit|
      test_number = (partial_number.to_s + last_digit.to_s).to_i
      return test_number if Luhn.new(test_number).valid?
    end
  end
end

# should have thought more about my data structure and making my code more intentional towards it
# rather than have the transformation logic in addends, if an array of integers was my primary object that I wanted to work with, I should have cleaned up that code
