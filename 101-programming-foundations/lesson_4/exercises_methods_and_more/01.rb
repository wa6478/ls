# Exercise 1

# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# evaluates to => []
# because select is the last thing evaluated
# select returns a new array with the selected items (of which none meet the num > 5 criteria)
# after check: wrong. the real last item evaluated is 'hi', which has a boolean value of true
# therefore select actually evaluates to => [1, 2, 3]