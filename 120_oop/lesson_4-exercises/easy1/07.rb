# Question 7

# What is the default thing that Ruby will print to the screen if you call to_s on an object? Where could you go to find out if you want to be sure?

# The default behavior when you call to_s is based on the Object class's to_s. This is because unless a Class has defined its own to_s method, it will traverse up the inheritance hierarchy as part of its method lookup path. And Object#to_s will by default return a string object of the object's class name and an encoding of the object id.

# To be sure, I would check the ruby documentation for the Object class. If I wasn't sure where to even look, I would call ancestors on my object and check each class or module going up the method lookup path to see if it included the method I'm looking for.