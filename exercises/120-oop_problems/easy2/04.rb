# Reverse Engineering

# Write a class that will display:

# ABC
# xyz
# when the following code is run:

class Transform
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def uppercase
    data.upcase
  end
  
  def self.lowercase(data) # another name for class method is singleton method. The more you know...
    data.downcase
  end
end


my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')