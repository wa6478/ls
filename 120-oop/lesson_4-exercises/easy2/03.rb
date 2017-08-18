# Question 3


module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

# A: Ruby will look at that object's method lookup path, looking for methods within its own class first, then modules within its own class (last listed first), then up its superclass, then its superclasses modules, and so on.

# You can find an object's ancestors with the `ancestors` method called on its class
# I.e. `object.class.ancestors`
# or just `class.ancestors`

# What is the lookup chain for Orange and HotSauce?

# A: Lookup chain for Orange: [Orange, Taste, Object, Kernel, BasicObject]
# A: Lookup chain for HotSauce: [HotSauce, Taste, Object, Kernel, BasicObject]
