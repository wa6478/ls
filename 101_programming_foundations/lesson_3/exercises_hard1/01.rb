# Question 1

# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

# throws an error because greeting is undefined variable
# assumptions:
# main method's default "truthiness" is true
# therefore false trigger never trips
# therefore greeting is never assigned
# therefore calling greeting is calling an undefined variable



# update to model
# if you attempt to reference an unintialized variable, what I mentioned above is correct
# however if you initialize it within a conditional statement, even if isn't triggered
# the variable is initialized to nil