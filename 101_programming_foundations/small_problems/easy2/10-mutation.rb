array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array1
puts array2

# first read:
# arrays are their own objects in memory
# the first Array#each iteration passes its string values to the second array
# but my assumption is that the second array is its own object in memory
# therefore using a mutating method on the values in the first method
# doesn't change array2, as the strings in array2 are part of a separate objects (might be different if they were symbols or integers)

# so looks like I was wrong.
# I suppose that makes sense when I look at in a simplified way
# as in, array1 is moving its pointers into array2
# so array2 is full of pointers at string objects that are the same as the string objects array1's pointers are pointing at
# I suppose it would be different with integers and symbols though since those would change what object in memory those arrays are pointing at
# let's test:

array1 = (1..10).to_a
array2 = []
array1.each { |value| array2 << value }
array1.map! { |value| value += 10 }
puts array1
puts array2

# yep that's correct. makes sense since integers are immutable, so in order to change what integer something is pointing at, the first array is merely pointing at different things

# => How can this feature of ruby get you in trouble? How can you avoid it?
# trouble would be from thinking that you are working with one set of objects or values but really you are working with different objects which can break things
# way to avoid is avoid mutating what some variables point especially if other variables point to that earlier variable
# perhaps there is a general notion of wanting to avoid mutation unless you know you won't need your earlier objects at all


# (pass by value) you can't change immutable objects, at best you can create a new object that your variable now points to
# (pass by reference) if you cange a mutable object, all variables pointing at that object will, by defintion, return the mutated object

# think of an array as a book, with page numbers as the index
# by ripping out a page and putting another page in, I haven't changed the enclosing element (the book), just the string (page) which is now the book.
# the book has been mutated
# if instead I refer to the book with another non-mutating method, I make a copy of the book (pass by value), and make changes to that. Now I have two books (two separate objects), and haven't modified my original book

# pass by reference means I make a copy of the reference, an alias of the reference/signifier, so if I mutate that object all aliases that point at that object will return the mutated object
# pass by value means I make a copy of the object and pass back the reference of the new object. If I modify this new object, all the old references to the original object still point at the original object, and changes to the copy won't change what they point at

# another way to think of pass by reference is that it hands the method the keys to the same house, rather than making a copy of the house (which would be pass by value)
# if I hand off the keys to the same house, and you make changes to it, and I come home, I will be in the changed house
# if I gave you a copy of the house instead you would be in a different house

# another way to think about (going back to the book), pass by reference is like lending you my book, and pass by value is getting you a copy of my book
# if you change the book I lent you (rip it, write in marginalia, or make highlights), and I call on that book, I will get the changed book
# if I gave you a copy of the book, and I call on my original book, it will be unchanged, because you never had the original to change in the first place

# immutable objects are like special books that you can't write on
# if you try to change it, it will just point you to a new book that has the change you want already on it
# so in that sense, it always operates like pass by value, because you can't change a given book (hence, immutable!)
# like some sort of special artifact
# so stuff like integers, nil, and ranges are special artifacts that are one-of-a-kind, and if you try to change it you will just get a different one that matches what you wanted rather than changing the specific object. In this analogy, the number 1 and 2 are two discerete separate objects.

# but like the articles on mutability and object passing strategy says, a passed reference isn't a guarantee that the referenced object can be modiied
# so even if I pass by reference an immutable object (like an integer), it's a special artifact that you can't modify, so even though it's passed by reference, in practice, it acts like it was passed by value

# "ruby is neither pass by value nor pass by reference, but instead employs a third strategy by passing around copies of the references ("pass by reference *value*") [that is copies of the where the references themselves].""
# I suppose it means that ruby basically just gives you copies of keys to access books. If it's a mutable book, you can change it and seems to act like "pass by reference". If it's immutable, even though you have a copy of the keys to reference the book, it's a special artifact, so even though you want to change it, you can't.

