# Question 7

# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# 34
# mess_with_it is performing a non destructive method on an immutable object (immutable because none of the object's Class methods can mutate it)
# impossible to change the object from within the method
# therefore impossible to change the variable assignment from within the method

