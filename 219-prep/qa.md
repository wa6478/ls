
# Questions & Answers

## JavaScript

### What is a type in JavaScript?
Type refers to the data structures used in the JavaScript programming language. JavaScript has several built-in types.

### What does it mean for JavaScript to be loosely typed (aka dynamic)?
It means you don’t have to declare a variables type ahead of time. It will be determined automatically when the program is being processed.

### How do you perform type conversion (aka coercion)?
JS doesn’t actually convert, it just returns the new value of the proper type. You can use explicit type coercion, by using the appropriate global object or by calling a method of the wrapper. You can also use implicit conversion but it’s considered unclear and should be avoided.
```
String(123); // ‘123' (via String global object)
123.toString() // ‘123' (via Number method)

```

### What is a primitive?
A primitive is data that is not an object and has no methods. They are immutable. In order to work with these primitives in JavaScript, they have wrapper objects that allow us to work with these data types (JS will automatically convert or wrap the primitives to their corresponding wrapper object so we can call the wrapper object’s methods or properties).

### What are primitive types in JavaScript?
In ES5 there are five primitive data types.
- strings
- numbers
- booleans
- null
- undefined

### What is variable scope?
A variable’s scope is the part of a program that can access that variable by name. That is to say, what part of the program can see that variable and ask for its value.

### What creates new scopes in JavaScript?
Functions create new scope. Blocks do not create new scope (such as the block in a `for` or `if` statement.) Functions have access to their own scope, and the scopes of any surrounding scopes they are nested in. 

A function at the top level would have access to its own scope, and the global scope it is nested in.

Defining a function closes over the scope in effect where it is defined. This is called creating a closure.

### How does variable scoping work in JavaScript?
JavaScript uses lexical scoping to determine variable scope. That means the structure of the source code defines the scope. When resolving a variable, it uses the hierarchy of scopes in the structure of the code, starting from the local scope all the way to the global scope.

### What is variable shadowing?
When a variable in an inner scope has the same name as a variable in an outer scope, effectively rendering the variable in the outer scope invisible.

### What is hoisting?
JavaScript processes variable or function declarations before it executes any code within a scope. Therefore, declaring a variable anywhere within a scope is the same as declaring it at the top of the scope. This is hoisting.

Note that assignments (even if in the original code they were on the same line as the variable declaration), are not hoisted. They stay where they are.

However, for function declarations, it also hoists the function body. Note that if a function expression is being assigned to a variable, just like other assignment, this function expression would not be hoisted.

Function declarations are processed before variable declarations.

### What is a statement?
Statements are what compose a JavaScript application. They themselves do not necessarily resolve to a value, but instead “do” something. 

Examples of statements in JavaScript: 
- variable declarations and function declarations
- control flow (blocks {}, if...else conditional statements, break, continue, switch, try...catch)
- iterations (do...while, while, for, for...in). 

Multiple statements can be on the same line as long as they are separated by a `;`.

### What is an expression?
Is code that resolves to a value. It generally utilizes operators to that end, but does not have to. 
Common types of expressions: 
- Arithmetic expressions evaluate to a number.
- String expressions evaluate to a string.
- Logical expression evaluate to `true` or `false`.

Examples of expressions in JavaScript using operators:

- assignment operators (`x = 14` `x += 1`)
- comparison operators (`===` `!==` `<=`)
- arithmetic operators (`x + 3` `10 / 2` `-3` `i++` `i—`)
	- that `-3` is called “unary negation” (unary because the operator has only one operand), just makes a number negative
- logical operators ( `||` `&&` `!`)
- comma operator in a for loop (when you have multiple variables that are updated)
- unary operators (`delete` `typeof`)
- string operators (`+` `+=`)

### What is a function declaration?
Defines a variable of type `function`. Variable is actually optional. Function declaration is a statement. The value of the variable is the function itself. 

`function name(args) { block }`

### What is a function expression?
Function expression is an expression that resolves to a function. Often used to assign a function to a declared variable. Generally, you would use anonymous functions in these cases.

```
var foo = function () { // declaring var to anon function
  return function() { // function express as return value
    return 1;
  }
};

var bar = foo(); // bar is assigned to returned function

bar(); // 1
```

### What is the difference between parameters and arguments?
When you are defining a function, the values passed into it are called parameters. When you are invoking that function, the values passed in are called arguments.

### What are objects in JavaScript?
Objects are what JavaScript uses to encapsulates data and behavior. The data consists of named items with values. These values are called properties.

JavaScript has many built-in objects (String, Array, Date, Math, etc.)

### What is a method (as opposed to a function)?
Functions define the behavior of an object. When they are part of an object, they are called methods.

### What are object properties in JavaScript?
Object properties are the names and values an object keeps track of, which can be used or retrieved by the program.

### What is mutation?
Mutation is when an object itself is mutated or changed. This means that all variables pointing at that object in memory will return the modified object. Immutable objects are unchangeable (such as the primitive types in JS). Whether an object is mutable or immutable affects whether a function parameter behaves as pass by reference or pass by value. 

### What is a side effect?
A side effect is when a function modifies a variable or mutates an object outside of its local scope.

### What are pure functions?
A pure function is one that returns a value with no side effects. They only rely on their arguments to determine their return value.

# Candidates:

## Write a reduce function in JS so that the below logs the correct answer

var smallest = function(result, value) {
  return result <= value ? result : value;
};

var sum = function(result, value) {
  return result + value;
};

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49
