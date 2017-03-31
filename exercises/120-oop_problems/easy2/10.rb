# Nobility

# Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.

# We need a new class Noble that shows the title and name when walk is called:

module Walkable
  def walk(name, gait) # Should probably assume I can't modify this, but otherwise what's the point of mixing them in? 
    puts "#{name} #{gait} forward." # Answer modifies all the other classes
                                    # to have a to_s method, and instead of name, calls self
  end
end

class Noble
  include Walkable

  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  # def name
  #   "#{@title} #{@name}"
  # end

  def walk
    super((title + ' ' + name), gait)
  end
  
  def gait
    'struts'
  end
end


byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron struts forward"
# We must have access to both name and title because they are needed for other purposes that we aren't showing here.

puts byron.name
# => "Byron"
puts byron.title
# => "Lord"