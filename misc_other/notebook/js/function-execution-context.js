// JavaScript has first-class functions.
// This means functions can be referenced by variables, passed in as arguments and returned from other functions.

function foo() {
  return "hello";
}

function baz(func) {
  return func;
}

baz(foo); // returns function `foo`

// To be used this way, the context of these functions is defined at function invocation (when it is executed), not when it is defined.
// The context of a function is the object that `this` references. <???>

var obj = {
  a: function () { // function that is assigned to a property of an object is called a method
    console.log("I'm " + this.b);
  },
  b: "green"
}

obj.a(); // logs "I'm green" which references the property `b` of the receiver, i.e. the method call's context

// To prove that execution context is defined at invocation and not definition:

var green = obj.a; // declare variable and assign to the function returned by obj.a
green(); // logs "I'm undefined" because when the function is invoked without an explicit receiver, the global object becomes the implicit receiver, making the global context the context in which this function executes
// `this` now references the global object which does not have a `b` property (i.e. `window.b` returns `undefined`)

// This stands in contrast to a function's variable scope, which is based on where the code is defined (lexical scoping rules).

// Functions without an explicit receiver have an implicit execution context.
// In JavaScript, the implict execution context is always the context of the global object (i.e. global context).
//   implict context == global context

function foo() {
  console.log("hello");
}

foo(); // logs: "hello"
window.foo(); // logs: "hello" -- window is the global object in the browser

// Because execution context is evaluated at invocation, the above behavior if not properly understood can lead to the apparent "loss" of context.
// A nested function does not inherit the context from the surrounding function.

var a = "world";
var obj = {
  a: 42,
  b: function() {
    return function() {
      console.log(this.a);
    }
  }
}

var hello = obj.b(); // returns the function and assigns it to variable `hello`
hello(); // logs "world" because the context is not determined until function invocation, which here is the implicit context since `hello` is being invoked without an explicit context

// We can change the code in several ways to avoid this context "loss"

// 1. assign a local variable the closure has access to with a reference to the current object

obj.b = function() {
  var self = this;
  return function() {
    console.log(self.a);
  };
}

hello = obj.b();
hello(); // logs "42" now. This works because the closure still has access to the variable self

// 2. use `bind` to permanently bind the returned function to a given context

obj.b = function() {
  return function() {
    console.log(this.a);
  }.bind(this); // note that unlike `call` or `apply`, `bind` doesn't execute the function but instead returns a new function that is bound to the context of the argument
}

// 3. use 'call' or 'apply' to define the execution context explicitly

hello.call(obj);

// The nested function that is returned by the method call is invoked without an explicit receiver, and therefore will execute in the global context.
// Therefore `this` references the global object, rather than `obj`.

// It can be said that function declarations and global variable declarations define properties of the global object.

var bar = "hello";
bar; // "hello"
window.bar; // "hello"

// Variable assignment without declaration default to the global object:

baz = "world"; // equivalent to `window.baz = "world"`
window.baz; // "world"

// This is why a new variable is created in a function scope without a function declaration becomes a property of the global object.

