# Exercise 4

# For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

p arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1

p arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[-1] = 4
p arr2

p hsh1 = {first: [1, 2, [3]]}
hsh1[:first][-1][0] = 4
p hsh1

p hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][-1] = 4
p hsh2