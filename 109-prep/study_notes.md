# 109 Assessment: Ruby and General Programming
## Notes

### Specific Topics of Interest

Write up an answer for each of the following:

Be able to explain clearly the following topics:

### local variable scope, especially how local variables interact with blocks and methods

- local variable is created when the parser encounters the assignment, not when assignment occurs (i.e. assignment encountered within an if statement that is in the false branch, is still assigned to nil, even if 'assignment' as such didn't occur)
- local variables created outside of blocks are accessible to the inner scope of blocks
- local variables created inside of blocks are NOT accessible to the outer scope
- `for` loop does not create it's own scope
- conditional expressions do NOT create their own scope (`if`, `case`, etc.)
- no local variables are accessible to methods, methods have entirely independent scope
  - you can only pass local variables as arguments to the method, but those are passed by reference value, not the actual variable assignment itself (i.e. it's impossible to reassign a outer scope local variable from within a method. At best, you can mutate an object that it's pointed at, but you cannot change its assignment)
- if they have the same name, ruby will give preference to local variables over methods

### how passing an object into a method can or cannot permanently change the object

In my own words...
The question here is about whether Ruby is pass by reference or pass by value. In actuality, Ruby is pass by *reference value*, but the way that plays out depending on the object or the methods called on that object can make it appear to be pass by value or pass by reference.

When an immutable object is passed into a method, try as it might, the method cannot change that object. Which makes it appear as if Ruby is pass by value when it comes to immutable objects (such as numbers). Ruby also appears to be pass by value when we pass a mutable object to a method, but no destructive methods are performed on the object (e.g. we pass in a string, but we don't mutate the string).

However, when we pass in a mutable object and mutate it (or objects pointed at from within a collection), Ruby appears to be pass by reference, that is we are passing a reference to the original object to the method to do with it as it pleases.

As an analogy, I like to think of the object passed to the method as a physical book. 

When I pass the method the address of where I keep the book, it's like saying, here is where it is, do with it as you please. The method then can go look at it and make its own copies of it, or it can go write in it, modify it, or tear it up. This is the equivalent of pass by reference.

Alternatively, I can pass the method the address of a place where I've placed a *copy* of the book. Now even if the method goes messing with the book, the original is fine. This is the equivalent of pass by value.

But since Ruby is actually pass by reference value, I have to give the actual address of where the book is, so the only way to make the method leave my book alone is to give it an immutable book, that even if it tries to modify, it can't actually touch it. The effect of this is pass by value.

### working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc). Study these methods carefully.

`Array#each`, `Hash#each`
what it does: invokes the given block for each element (or key/value pair in case of a hash)
what it returns: the calling object (whether hash or array)

`Array#map`, `Enumerable#map`
what it does: invokes the given block for each element (or key/value pair in case of a hash)
what it returns: a new array with the values returned by the block

`Array#select`, `Hash#select`, `Enumerable#select`
what it does: invokes the given block for each element (or key/value pair in case of a hash)
what it returns: a new collection (hash or array) consisting of entries or elements for which the block returned true
*`reject` works the same way except returns a new collection where the block returned false

### variables as pointers

- variables are not objects
- they point at objects (or more specially address space in memory)
- when two variables point at the same object and that object is mutated, they will both still point at the mutated object
- when one variable is re-assigned to a new object, that doesn't mean the other variable will follow, even if the latter variable was pointed to the object by referencing the former variable

### puts vs return

- puts is a method that prints a string
- what's tricky is that puts also returns `nil` so often can trip things up when people think "all it does is print something on the screen", etc.

### false vs nil

- false is !true, or boolean false
- nil is a false value meaning 'nothing at all', 'unknown', or 'no value'
- they both evaluate to boolean false

### implicit return value of methods and blocks

- the implict return value of methods and blocks is the last evaluated expression within the method or block
- so if there is a `puts` sitting at the end of your method or block, it's going to return `nil`, since that is the return value of puts




