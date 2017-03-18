# Log

### 2017-03-18


### 109 Assessment Notes

#### local variable scope, especially how local variables interact with blocks and methods

- local variable is created when the parser encounters the assignment, not when assignment occurs (i.e. assignment encountered within an if statement that is in the false branch, is still assigned to nil, even if 'assignment' as such didn't occur)
- local variables created outside of blocks are accessible to the inner scope of blocks
- local variables created inside of blocks are NOT accessible to the outer scope
- `for` loop does not create its own scope
- conditional expressions do NOT create their own scope (`if`, `case`, etc.)
- no local variables are accessible to methods, methods have entirely independent scope (they have no notion of inner or outer scope)
  - you can only pass local variables as arguments to the method, but those are passed by reference value, not the actual variable assignment itself (i.e. it's impossible to reassign a outer scope local variable from within a method. At best, you can mutate an object that it's pointed at, but you cannot change its assignment)
- if they have the same name, ruby will give preference to local variables over methods

#### how passing an object into a method can or cannot permanently change the object

In my own words...
The question here is about whether Ruby is pass by reference or pass by value. In actuality, Ruby is pass by *reference value*, but the way that plays out depends on the object or the methods called on that object. It can make it appear to be pass by value or pass by reference.

When an immutable object is passed into a method, try as it might, the method cannot change that object. Which makes it appear as if Ruby is pass by value when it comes to immutable objects (such as numbers). Ruby also appears to be pass by value when we pass a mutable object to a method, but no destructive methods are performed on the object (e.g. we pass in a string, but we don't mutate the string).

However, when we pass in a mutable object and mutate it (or objects pointed at from within a collection), Ruby appears to be pass by reference, that is we are passing a reference to the original object to the method to do with it as it pleases.

As an analogy, I like to think of the object passed to the method as a physical book. 

When I pass the method the address of where I keep the book, it's like saying, here is where it is, do with it as you please. The method then can go look at it and make its own copies of it, or it can go write in it, modify it, or tear it up. This is the equivalent of pass by reference.

Alternatively, I can pass the method the address of a place where I've placed a *copy* of the book. Now even if the method goes messing with the book, the original is fine. This is the equivalent of pass by value.

But since Ruby is actually pass by reference value, I have to give the actual address of where the book is, so the only way to make the method leave my book alone is to give it an immutable book, that even if it tries to modify it, it can't actually touch it. The effect of this is pass by value.

#### working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc). Study these methods carefully.

`Array#each`, `Hash#each`
- what it does: invokes the given block for each element (or key/value pair in case of a hash)
- what it returns: the calling object (whether hash or array)

`Array#map`, `Enumerable#map`
- what it does: invokes the given block for each element (or key/value pair in case of a hash)
- what it returns: a new array with the values returned by the block

`Array#select`, `Hash#select`, `Enumerable#select`
- what it does: invokes the given block for each element (or key/value pair in case of a hash)
- what it returns: a new collection (hash or array) consisting of entries or elements for which the block returned true
*`reject` works the same way except returns a new collection where the block returned false

#### variables as pointers

- variables are not objects
- they point at objects (or more specifically address space in memory)
- when two variables point at the same object and that object is mutated, they will both still point at the mutated object
- when one variable is re-assigned to a new object, that doesn't mean the other variable will follow, even if the latter variable was pointed to the object by referencing the former variable

#### puts vs return

- *"Ruby methods ALWAYS return the evaluated result of the last line of the expression unless an explicit return comes before it."*
- `puts` is a method that prints a string
- what's tricky is that `puts` also returns `nil` so often can trip things up when people think "all it does is print something on the screen", etc.
- `return` is a keyword that exits a method
- explicit `return` exits a method and returns the value evaluated in that line of code or the last evaluated expression prior to `return`

#### false vs nil

- false is !true, or boolean false
- nil is a false value meaning 'nothing at all', 'unknown', or 'no value'
- they both evaluate to boolean false

#### implicit return value of methods and blocks

- the implict return value of methods and blocks is the last evaluated expression within the method or block
- so if there is a `puts` sitting at the end of your method or block, it's going to return `nil`, since that is the return value of `puts`

###Misc notes

**Know your tools**
- better know a few methods and classes really well and know how to use them than to know a ton of different methods
- being able to think clearly with the tools you have trumps having a massive toolkit you're not that familiar with

**Always start with the simpler (even if longer) solution first**
Rather than trying to accomplish the most elegant or terse solution on the first try, err on the side of solving the problem with a simple solution

Refactoring can come later

**`sort` can be written to accomplish what `sort_by` does**
The key is to remember that the block in `sort` needs to evaluate a return of -1, 0, or 1
As long as you write the block that way, `Enumerable#sort` can do what Enumerable#sort_by does, and actually even a bit more flexible if you want reverse order

e.g.
```
hash.sort do |(k1,v1), (k2,v2)| 
  k2.to_s.length <=> k1.to_s.length
end

# would return the same as

hash.sort_by do |k, v|
  k.to_s.length
end.reverse # have to call reverse because sort_by only does ascending order

# although have to consider that for sort_by, the documentation reads "The result is not guaranteed as stable. When two keys are equal, the order of the corresponding elements is unpredictable."

so the results may not always be identical if the items being compared are the same size (i.e. <=> returns 0)
```

**Useful to know about the Enumerable module**
> The class must provide a method each, which yields successive members of the collection. If Enumerable#max, #min, or #sort is used, the objects in the collection must also implement a meaningful <=> operator, as these methods rely on an ordering between members of the collection.
https://ruby-doc.org/core-2.4.0/Enumerable.html

**loop vs. iteration return value**
break in a loop returns nil
whereas
an iterator like each will return the calling object

**Fetch in Hashes**
Can use fetch in both hashes and arrays, and will only return a value if the key or index actually exists

**Coding with intention - side effects and return values**
Know whether your method is supposed to return a value or produce side effects
Don't conflate objectives within the same method

**On mindset**
Walk towards ambiguity, and break it down and understand it. Explore the edge cases. Apply a programming mindset. Don't run away from ambiguity.

*Bookmark:* **Ruby's Mutating and Non-Mutating Methods**
https://launchschool.com/blog/mutating-and-non-mutating-methods

**How to say things**
```
def some_method(input)
  input += " hi" # reassignment # input = input + " hi" 
  input + " hi"  # (+() concatenation method call not destructive)
  input << " hi" # shovel operator concatenation (destructive)
end
```

**Symbols are immutable**

**Element Reference (Slice) vs. Element Assignment**
Don't confuse element reference (slice) `[]` with element assignment `[]=`
Element assignment is destructive

**Transformation vs. Mutation**

Transformation - changes which occur on a new object
Mutation - changes which occur on the original object

**Multiple Assignment**

Multiple assignment is possible
```
a, b, c = 1, 2, 3
# a=>1, b=>2, c=>3
```

Array decomposition during multiple assignment
```
a, b = [1, 2]
# a=>1, b=>2
```

Excess numbers on right will be ignored unless splat is used to mop up
```
*a, b = 1, 2, 3
# a=>[1, 2], b=>3

a, *b = 1, 2, 3
# a=>1 b=>[2, 3]
```

Implicit array assignment
```
a = 1, 2, 3
# a=>[1, 2, 3]
```

### 2017-03-17
In lieu of a Medium blog, I will keep this log to track things of note. The log's informality makes it more likely that I will jot things down and record observations or thoughts, so it will serve as a substitute for now, especially in the early days. Also easier to reference, search, etc.

**Misc notes**

- first place you call a variable is called initialization
- when you assign that variable to something else later, it's reassignment
- to clarify as to whether you’re referencing a local variable or a method, can call the method with (), e.g. for a method called str, str()
- calling a method -> “method invocation”
- “passing in a string as an argument to this method”
- “printing the return value of the method invocation”
- if a local variable has the same name as a method and you call that reference, Ruby will default to the variable
- blocks have inner scope that’s different from method scope
  - blocks can access variables created outside the block
  - methods can only access variables within the method (commonly passed in as an argument)

**Shallow Copy**

- #dup #clone can create shallow copy of collections
- that means they can create a new object that is a copy of the collection
- however, it's shallow because the objects within the collection aren't copies
- they will still point at the same objects, and if they are mutated the cloned collection can do nothing to prevent that and will reflect the mutated objects within it
- difference between dup and clone is that clone respects #freeze, dup does not
- freezing prevents objects from being modified
- can only do to mutable objects, since immutable objects are already frozen
- no way to easily make deep copies in ruby

