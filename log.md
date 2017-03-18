# Log

### 2017-03-17
In lieu of a Medium blog, I will keep this log to track things of note. The log's informality makes it more likely that I will jot things down and record observations or thoughts, so it will serve as a substitute for now, especially in the early days.

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

--

Shallow Copy

- #dup #clone can create shallow copy of collections
- that means they can create a new object that is a copy of the collection
- however, it's shallow because the objects within the collection aren't copies
- they will still point at the same objects, and if they are mutated the cloned collection can do nothing to prevent that and will reflect the mutated objects within it
- difference between dup and clone is that clone respects #freeze, dup does not
- freezing prevents objects from being modified
- can only do to mutable objects, since immutable objects are already frozen

