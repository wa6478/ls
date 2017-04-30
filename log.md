# Log

**"Slow is Smooth, Smooth is Fast"**

### 2017-04-30

Thoughts on developing Hunt the Wumpus web app:
- Developing the base game actually did not take much time
- Getting it to work as a web app and writing a test suite were relatively much more challenging
- Was useful in getting a better idea of how to write tests and working with sessions
- Games actually have a lot of possible scenarios to test (especially with things that have a chance of happening), so it seems like there is a better way to think about these tests than the way I did them
- Wrote almost all of the tests after the game, but now see the value in doing this much earlier on
- This would have probably saved me time overall, as I would be able to quickly see if the changes I'm making are breaking any expected functionality
- However, I was reluctant early on because part of what I was doing was still figuring out how I wanted to do things in the first place -- but even so, making the writing and rewriting of tests more second nature seems like a more robust way to develop 
- The CSS portion took quite a while, mostly due to my lack of familiarity
- Getting practice on little housekeeping tasks like working with git, heroku, bundle, etc. is helping me feel a little more fluent in my workflow

Things I would do differently next time:
- Try to make the program more modular
  - For example, rather than having lots of nested logic in various methods as things resolve, update the board state
    - That way, every time there is a `get '/dungeon'`, it would just interrogate the board state to see if any game ending conditions have been met, rather than having a bunch of if logic to test if the wumpus moved, and then checking if he moved if he's in the same place as the player
    - Instead, this would just check if a game ending condition exists (e.g. wumpus is in the same location as the player) and then set the :game_over session to be the message for that condition
    - Then if that happens, have a redirect to `/game_over` that can then read the session and access by index a hash that has the ending messages (perhaps stored in a yaml file even for easy maintenance?)
- also would move the classes into their own files to `require`
- and for one off methods that we need to resolve game logic (say firing an arrow), wrapping those methods up in a module that can just be included, rather than having them cluttering up my routing logic
- also by making things more modular, might perhaps enable me to expand the game and make it more interesting
- perhaps add mushrooms to the dungeon that the wumpus seeks out giving it a reason to move around, and if it eats all the mushrooms it can find, perhaps being aggressive about seeking out the player
- this would all be easier to do if game ending logic and states of objects were a little more clearly delinated than I have it in my current iteration (not sure exactly what that would look like, but it would probably come with a bit more confidence around how I can manipulate objects)

Next I'm going to try to build one more application with user sessions, and more File IO type stuff since I definitely still sense a bit of confusion for me with those concepts.

### 2017-04-20
Seems like in general, thinking about your data structure and how it's going to fit in your application is really important. Refactoring the todo application is making me realize just how much of a pain it is to mentally keep track of the different ways to track states when you are mixing arrays and hashes (do I need the index number? Do I need a particular key?).

So having clarity on that just seems extremely important. And in general, it seems useful to use hashes over arrays for larger datasets because trying to keep track of indexes becomes more difficult, especially when you can have javascript able to manipulate elements in the DOM, which then causes the routing to go goofy. Better to just have explicit keys for this data.

- Is using POST as the HTTP method for a request more secure than GET? Why or why not?

No. Both transmit the request in plain text. GET transmits it as part of the path, POST as part of the body, but it's still in plaintext.

- How can a web application be secured so that any data being sent between the client and server can not be viewed by other parties?

The application has to be configured to use the `https` protocol, which encrypts communication between the client and the server.

### 2017-04-13
https://launchschool.com/blog/growing-your-own-web-framework-with-rack-part-1

"The existence of a Gemfile implies that we’ll use Bundler to handle dependencies in our application."

""
- Rack is a web server interface, which gives back-end application developers a stable communication protocol between application code and web servers. 
- Rack is a specification for connecting our application code to the web server, and also our application to the client. 
- It sets and allow us to utilize a standardized methodology for communicating HTTP requests and responses between the client and the server. 
- To accommodate this standard, Rack has some very specific conventions in place.

"And there you have it, we now have all the requirements for our Rack application. 
- We have a configuration file that tells the server what to run (the `config.ru` file).
- We also have the application itself, the HelloWorld class in the `hello_world.rb` file. 
- We know it is a Rack application because it has 
  - the method `call(env)`, and that method **returns** 
    - a 3 element array containing the exact information needed for a proper Rack application: 
      - a status code (string), 
      - headers (hash), 
      - and a response body (responds to `each`)."

"Note that Rack doesn’t come with its own server, but it’s smart enough to automatically try to use a sever that’s already installed on your machine. If you didn’t install any server, like Puma or Thin, then Rack will just use the default server that comes with Ruby, Webrick."

HTTP

**What are the required components of an HTTP request? What are the additional optional components?**
- Required: 
  - Method (e.g. GET), 
  - Path (where you want to go on the host)
- Optional:
  - Parameters (query started with reserved char ? and delimited with &)
  - Headers
  - Body

**What are the required components of an HTTP response? What are the additional optional components?**
- Required:
  - Status (200 OK, 302 Redirect, 404 Page not found, 500 generic server error, etc.)
- Optional:
  - Headers: (content-type, tell the client what's being sent back)
  - Body: the data

**What determines whether a request should use GET or POST as its HTTP method?**
- GET is to retrieve content from the server
- POST is to change values that are stored on the server

### 2017-04-11
Constant Resolution
https://cirw.in/blog/constant-lookup.html

Web Dev material, wumpus?, challenges?

### 2017-04-10
https://robots.thoughtbot.com/back-to-basics-polymorphism-and-ruby
https://devblast.com/b/ruby-inheritance-encapsulation-polymorphism


### 2017-04-09
**Fake Operators**

Method	Operator	Description
yes	[], []=	Collection element getter and setter.
yes	**	Exponential operator
yes	!, ~, +, -	Not, complement, unary plus and minus (method names for the last two are +@ and -@)
yes	*, /, %	Multiply, divide, and modulo
yes	+, -	Plus, minus
yes	>>, <<	Right and left shift
yes	&	Bitwise "and"
yes	^, |	Bitwise inclusive "or" and regular "or"
yes	<=, <, >, >=	Less than/equal to, less than, greater than, greater than/equal to
yes	<=>, ==, ===, !=, =~, !~	Equality and pattern matching (!= and !~ cannot be directly defined)
no	&&	Logical "and"
no	||	Logical "or"
no	.., ...	Inclusive range, exclusive range
no	? :	Ternary if-then-else
no	=, %=, /=, -=, +=, |=, &=, >>=, <<=, *=, &&=, ||=, **=, {	Assignment (and shortcuts) and block delimiter


**Misc**
- Can do 1 or 2 challenges or code problems as ongoing practice with other course work

### 2017-04-07
- Remember you can't build ranges in reverse...

### 2017-04-06
- More review of OOP

### 2017-04-05
**120 - Object Oriented Programming**

- classes and objects
- using attr_* to automatically create setter and/or getter methods, and how to call them
  - attr_accessor - create both a getter and a setter
  - attr_reader - create a getter
  - attr_writer - create a setter
  - getters can be called by their method name, whereas setters need to be called with `self` to disambiguate them from local variables
- instance methods vs class methods
  - class methods are called on the class `Class.class_method` whereas instance methods are called on an instance of a class `Class.new.class_method` (where `Class.new` creates a new instance of `Class`).
  - class methods are created at the same level as instance methods, but are prepended with `self` (e.g. `def self.class_method`).
  - class methods don't have access to instance methods or instance variables.
  - class methods do have access to class variables
  - class methods can instantiate new objects of their own class on which they can call instance methods
  - instance methods are the behaviors of an instantiated object of a class
  - instance variables are the state of such an object
  - instance method scope is at the object level
  - uninitialized instance variables return nil
  - class variables can be accessed and modified by both class and instance methods
- referencing and setting an instance variable vs using getter/setter methods
  - instance variables can be directly manipulated by calling the instance variable (e.g. `@instance_variable`, or `@instance_variable =`)
  - getters and setters, if named `instance_variable` and `instance_variable=`, can be invoked as `instance_variable` for the getter, and `self.instance_variable` for the setter
    - the reason the setter has to be called on `self` is that otherwise a statement like `instance_variable = 5` will be interpreted as the creation of a new local variable called `instance_variable` that's being assigned to five, rather than the instance_variable
- class inheritance
  - classes inherit all the methods of their superclass
  - they can overwrite super/parent class methods by using the same name
  - they can pass parts or all of the arguments up to the superclass using `super`
- modules
  - used for namespacing and mixing in methods into classes ("mixins")
  - cannot be instantiated (i.e. can't create an object from a module)
  - modules can contain methods and classes
  - in order to use them, they can be made available with `include`
- method lookup path
  - methods are first looked up in the calling class
  - then in the calling class's included modules (starting with the one listed last first)
  - then up to their parent class, following the same process, all the way up to Object > Kernel > BasicObject
- self
  - used to reference the calling object
  - when used in an instance method, the calling object will be an instance of a class
  - when used in a class method, the calling object will be the class itself
- calling methods with self
  - mostly used with setter methods in order to disambiguate them from setting a local variable
  - with the exception of the specific case mentioned above re: setter methods, this can't be used with private methods, as they will read using `self` like an external call to the private instance method
- more about self
- being able to read OO code
  - encapsulation is about hiding functionality and making it unavailable to the rest of the code base. It's a form of data protection, making it difficult to change code without obvious intention. It is what defines boundaries in your application.
  - objects allow the programmer to think at a new level of abstraction
- fake operators
  - fake operators are actually methods that can be redefined to create useful behaviors for one's classes
  - examples of fake operators are `<<`, `+`, `/`, `[]`, `[]=`, `<=>`, `==` etc.
  - they are actually methods invoked as `object.<<(argument)`, but ruby's syntactical sugar makes them appear as if they were operators
  - what isn't a fake operator actually appears to be the shorter list:
  - `&&` `||` (logical "and" "or"), `..` `...` range operators, ternary `? :`, assignment and block delimiters `=` `+=` `{`
- truthiness
  - everything that isn't `false` or `nil` is truthy
  - so for the purposes of logical operation or conditional evaluation, if something is truthy, it will evaluate to `true`
  - truthy `!=` `true`, but for the purposes of evaluation, truthy seems to behave that way
  - don't use assignment with a conditional -- unclear whether you are purposefully trying to perform assignment or have a syntax error with `==` equality comparison
- working with collaborator objects
  - collaborator objects are created when there are certain behaviors and states that are better abstracted in their own objects
  - they allow you to modularize the problem domain into cohesive pieces
  - for example, a card class could provide very useful collaborator objects to a deck class, where a deck could shuffle card objects instead of having to keep track of the states and behaviors of the cards itself

**130 - Ruby Foundations: More Topics**

- how blocks work, and when we'd want to use them
  - blocks are one way to implement ruby closures
  - has lenient arity, won't complain about number of args passed
  - When to use blocks:
  - When you want to leave some of the implementation decisions to method invocation time
  - When you have sandwich code, where there is something you do before and after some code runs (like a block). An example of this is opening a file, passing the file to the block, and then closing the file.
- how to implement your own each, select, reduce, and map in a custom collection-oriented class
- method invocation is when you call the method, method implementation is where you define the method

### 2017-04-04
- `String#scan` is a very powerful to return an array of words that match a given regex expression

### 2017-04-03

- Do the medium exercises again
- Weekly challenges
- Feedback submission
- Build 21 program again
- `StringIO` lets us simulate a `Kernel#gets`

- Array to arguments conversion:
https://ruby-doc.org/core-2.0.0/doc/syntax/calling_methods_rdoc.html#label-Array+to+Arguments+Conversion

**Closures**
- trying to return from an implicit block or externally defined proc will throw an error
- (this is because code execution jumps to the top level where the proc or implicit block is)
- trying to return from an internally defined proc or block will exit the method
- trying to return from a lambda (whether internally or externally defined) always returns control to the calling method
- a lone `&` applied to an object causes Ruby to try and convert the object into a block
- `&:to_s` is called a "symbol to proc" operation, but it should really be called a "symbol to block operation" because `to_proc` is called on the symbol (if it's not a proc alraedy), then `&` converts it into a block

**Enumerators**
- Easiest way to create a new Enumerator object is to call `to_enum` on a collection
- When you call an internal iterator on a collection without attaching a block, it is equivalent to calling #to_enum on the collection. (but discouraged per the documentation)
- `array.each == array.to_enum`
- https://chickenriceplatter.github.io/blog/2013/04/07/internal-vs-external-iterators/
- Internal iterators will traverse in a linear fashion, and as such are often useful but inflexible
- Creating an external iterator via Enumerator is a little more setup, but gives you more flexibility over how you iterate

### 2017-04-01

- Encapsulation: You don't want the user of a class to have to speculate about the internal state of a class.
- Therefore, hide implementation details so you can mitigate ripple effects if there are changes to the class

### 2017-03-31

- A closure is a "chunk of code" that has references to the artifacts that surround it -- its **binding**.
- Blocks are just another parameter passed in as an argument to a method at method invocation
- In Ruby, every method can take an optional block as an implicit parameter
- Method implementation is where you define a method
- Method invocation is when you call it
- The rules around enforcing the number of arguments you can call on a closure in Ruby is called its arity.
- In Ruby, blocks have *lenient* arity rules, which is why it doesn't complain when you pass in different number of arguments

Some terminology:
- block local variable
- block return value
- yield execution to the block
- invoke or call the block

**When to use blocks**
- You want to defer some implementation code to the method invocation decision
- Sandwich code - where we have a `before` then `some code` followed by an `after` -- `some code` is a great spot to yield to a block
- There are many useful use cases for "sandwich code". Timing, logging, notification systems are all examples where before/after actions are important.

- Defining blocks explicitly in a method (e.g. `def test(&block)`) can be nice if you want to be able to pass around the block to other methods within your method
- You can `yield` to such blocks or call `call` on the block (`block.call`)

-----

- For object oriented programming review, review exercises 120 - medium1 5-10

**Sublime Text Shortcuts**
- `cmd + ctrl + G` edit all instances of word at cursor
- `cmd + opt + G` go to the next instance of word at cursor
- `cmd + D` select word at cursor
- `cmd + P` to bring up search bar
  - can search file names and paths by default
  - `@` methods and classes
  - `#` variable names
  - `:` goto row
- `cmd + opt + 2` create split window (can create 3 with `+ 3`, etc.)
- `ctrl + 1` or `2` etc. to switch between split windows


- Changing text editors to remove trailing whitespace by default makes Rubocop happy

- Think of whether a noun is its own class, or a state that an object of an existing class would have
- modules for 'has-a' relationship ("`Car` has `Drivable` behaviors")
- parent class for 'is-a' relationship ("`Car` is a type of `Vehicle`")
- Modules can be used for namespacing (grouping common classes together) or grouping common methods together
- Modules can't be instantiated (they can't create objects of their own)
- "The method lookup path traverses the inheritance hierarchy"

**Receivers and Private/Protected/Public Methods**
- Calling a method on `self` is calling the method with an explicit receiver
- Same as calling a method on a specific object
- Private methods can only be called implicitly, i.e. without an explicit receiver
- Looks like private makes an exception for explicit receivers if its for a setter method using `self` to disambiguate itself from a local variable (a setter method *must* be used with self)
- Protected methods can only be called explicitly within the class's instance methods (but can also be called implicitly, like private methods)
  - Useful for comparing two objects of the same class within an instance method
- Public methods can be called explicitly from anywhere (inside or outside of the class), or implicitly from inside class instance methods

### 2017-03-24

- can use #{} to call a block variable to regex

### 2017-03-23

`slice` creates a new object.

Reduce is an enumerable method. Which means it iterates. Keep that in mind.

`reduce(initial) { |memo, obj| block }`
memo is equal to initial if supplied, else first element of collection

`reduce` is actually kind of like `with_object` because you can supply it an empty string as long as you are adding strings to it

upto, times - etc. loop or iterator?
what are && || called?

### 2017-03-22

Don't begin solving until you know exactly what problem you are solving. Properly list out all of the requirements of the problem, and your algorithm to specifically address those requirements.

#### Regex

Regex metacharacters are not the same inside and outside of a character class.

- Inside only: `^ \ - [ ]` are metacharacters.
- Outside of character classes: `$ ^ * + ? . ( ) [ ] { } | \ /`
- `\n` new line
- `\r` carriage return
- `\t` tab

To be on the safe side, you can escape all special characters, even if you don't have to

match([^x]) still returns a value that is true as long as 'x' is anywhere in the string, even though you are negating it for regex matching purposes

**character class shortcuts**
- `.` any char (this is a shortcut for a character class and can't be used inside another character class)
- `\s` whitespace chars (can be used as an additional group inside char class)
- `\S` non-whitespace chars (can be used as an additional group inside char class)
- `\d` any decimal (0-9)
- `\D` any character *but* a decimal
- `\h` any hexidecimal digit (0-9a-fA-F) **ruby only**
- `\H` any character *but* hexidecimal digit (0-9a-fA-F) **ruby only**
- `\w` any 'word' character: A-Z, a-z, 0-9, '_' < underscore
- `\W` any non-'word' characters

Outside of char classes:
- `^` beginning of line
- `$` end of line
Note: `^` and `$` respect `\n` as beginnings of new lines

- `\A` beginning of string
- `\z` end of string
- (less commonly used `\Z` goes up to but not including \n at the end of string)

- `\b` word boundary

**Quantifiers**
- `*` zero or more instances of the pattern directly to the left of this quantifier (or the pattern in parentheses directly to the left of this quantifier)
-`+` one or more instances of the pattern directly to the left of this quantifier
-`?` one or no instance of the pattern directly to the left
-`{m}` range quantifier, that matches `m` instances of the pattern directly to the left
-`{m,}` for `m` or more occurrences
-`{m,n}` more than `m` but not more than `n` occurrences

Note: quantifiers are greedy, they will always match as many characters as they can

`*?` force a *lazy* match instead of a greedy one

Ruby string matching: `String#scan` method is a global form of `match` that returns an Array of all matching substrings.

- `String#match`  Determine if regex matches a string
- `string =~ regex` Determine if regex matches a string
- `String#split`  Split string by regex
- `String#sub`  Replace regex match one time
- `String#gsub` Replace regex match globally


### 2017-03-19

Possible to introduce additional block variables and assign them within the block:

```
(1..10).each { |num, new_var| # => althought new_var will default to nil, interesting that this is possible.
```

**Push for simplicity**
When I get stuck in problems it tends to be that I've got some elegant notion in my head and struggling to translate it, or even be clear on what exactly I'm trying to do. Better to approach the problem with a very simple mindset.

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

Documentation:

> `Array#each` : Calls the given block once for each element in self, passing that element as a parameter. Returns the array itself.

> `Hash#each` : Calls block once for each key in hsh, passing the key-value pair as parameters.


`Array#map`, `Enumerable#map`
- what it does: invokes the given block for each element (or key/value pair in case of a hash)
- what it returns: a new array with the block's return values

Documentation:

> `Array#map` : Invokes the given block once for each element of self. Creates a new array containing the values returned by the block.
> `Enumerable#map` : Returns a new array with the results of running block once for every element in enum.


`Array#select`, `Hash#select`, `Enumerable#select`
- what it does: invokes the given block for each element (or key/value pair in case of a hash)
- what it returns: a new collection (hash or array) consisting of entries or elements for which the block returned true
*`reject` works the same way except returns a new collection where the block returned false

Documentation:

> `Array#select` Returns a new array containing all elements of ary for which the given block returns a true value.

> `Hash#select` Returns a new hash consisting of entries for which the block returns true.

> `Enumerable#select` Returns an array containing all elements of enum for which the given block returns a true value.

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

### Misc notes

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

