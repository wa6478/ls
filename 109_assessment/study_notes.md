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
### working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc). Study these methods carefully.
### variables as pointers
### puts vs return
### false vs nil
### implicit return value of methods and blocks



