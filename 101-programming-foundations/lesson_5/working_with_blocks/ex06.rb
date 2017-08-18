# Example 6

# Let's mix it up now with some variation. In the below example, we have an array of hashes, and we want to select all elements where every key matches the first letter of the value. Note that the keys are symbols here, so we'll have to do some conversion before comparison.

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
# There's a lot going on here, but you now possess all the necessary knowledge to take this apart, line by line, letter by letter. We won't do a full table of steps like before, but see if you understand every line and every letter in the code above. If you do not, take your time and study it; you should be able to deconstruct this code to its core.

# call select method on an array object that contains two hashes
# pass each hash to the block
# call all? method on each hash passed to the block
# pass key and values of the called object to the inner block
# use comparator to compare first index of value object (in this case string) to the key symbol transformed to string
# if all objects passed to the inner block evaluate to true, then hash.all? will evaluate to true, else will evaluate to false
# each hash for which hash.all? evaluated to true will be selected by select method
# select will return a new array with the selected hashes

# Q: What would happen if, instead of using all?, we used any?. Why would this affect the return value of select?

# any? would cause the inner block to return true for the first hash since it includes { a: 'ant' } which satisfies the test, and therefore would return all hashes in this particular instance since they all have at least any? object that passes the test, which returns truthy, and therefore is selected into the new array

