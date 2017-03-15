# Question 2

# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# what is != and where should you use it?
# A: Comparator for 'not equal to'. Use in a conditional.

# put ! before something, like !user_name
# A: returns the opposite of boolean true or false. If user_name is false, then !user_name will return true.
# returns the opposite of the boolean equivalent of the object

# put ! after something, like words.uniq!
# A: does nothing on its own. 'uniq!' is the name of a method, not the same as just uniq with an exclamation point at the end. Convention is that an exclamation at the end of the method name means it is destructive, but it's not a guarantee that this is what the method actually does.

# put ? before something
# A: seems like an invalid input or Ruby would through some sort of error... not sure
# also used in ternary conditional expressions as ? :

# put ? after something
# A: convention for methods that return a boolean (i.e. true or false) like Arrray#include?. Otherwise throws an error when used with a variable.

# put !! before something, like !!user_name
# A: Double bang reveals the "truthiness" of something. As long as user_name is not nil or false, double bang will return true. Otherwise false.
# "returns the boolean equivalent of the object"