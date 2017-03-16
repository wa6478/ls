# Exercise 6

# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# pop is going to return the last element in the array and destructively remove it from the original array. When we call size on pop's return value, we get 1, since without additional parameters it will only return the last object in the array.

# but actually it's 11, because pop doesn't just return the last value as an array object ['caterpillar'] but rather as a string object 'caterpillar' so the size is actually 11, which is the length of the returned string