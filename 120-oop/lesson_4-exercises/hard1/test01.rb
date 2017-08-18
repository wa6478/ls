# question: can I use super with modules?

module Doable
  def initialize(number)
    @number = number
  end
  
  def hundred
    100
  end
end

class Animal
  include Doable
  def initialize(number, type)
    super(number)
    @type = type
  end
  
  def hundred
    super + 10
  end
  
  def to_s
    "#{@number} #{@type}"
  end
end

kitty = Animal.new(123, 'tabby')
puts kitty

puts kitty.hundred

# YES! `super` works with modules as well as superclasses. Basically anywhere up the inheritance hierarchy.