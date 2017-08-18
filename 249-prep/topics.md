
# Important Topics You Need to Study:

What is AJAX?
Asynchronous JavaScript and XML. Using Ajax, data can be passed between the browser and the server, using the XMLHttpRequest API, without having to reload the web page.

What is jQuery?
A JavaScript library that takes browser support code and wraps it with universal methods that work across all browsers. At its core, jQuery is a function that wraps a collection of DOM elements and some convenience methods into an object.

## Functions and Objects
- Objects organize and relate state and behavior together
- Objects are especially useful when you need multiple instances of something
- Objects become more useful the larger the program becomes
## What "this" refers to
- `this` refers to the the object that represents the current function execution context
## Bind, Apply and Call
- `bind` returns a new function that has the original function but  is internally always invoked in the context of the object it was bound to
- `apply` and `call` methods invoke a function in the context that was passed in. Difference between the two is that `call` takes additional arguments to pass to the function with commas, and `apply` takes them as an array object.
## Use Web APIs to work with the DOM
`EventTarget` provides the event-handling behavior that supports interactive web applications. `Node` provides common behaviors for all nodes. `Text` and `Element` are the two primary types of nodes, with the former holding text and the latter holding HTML elements.

Identifying a node: roughly, can use `toString` method or check the constructor property of a node. However, the implementation details for these processes are not consistent, so in practice you should use `tagName` or `instanceOf` to confirm whether an element is of a certain type.
- Review, first assessment should be very helpful
## Understanding event driven programming for front end development
- setting event listeners and feeding callbacks
## jQuery and the DOM (selectors, event handling, DOM manipulation and animation)
- need to review manipulation and animation
## How to interact with forms using jQuery
- mostly ok, key is serializeArray and setting values of form fields to certain values
- wouldn't hurt to review as well -- see how I implemented in my project
## HTML templating with handlebars
```
// Using jQuery
var itemTemplate = Handlebars.compile($("#item_template").html());

// Using JavaScript
var itemTemplate = Handlebars.compile(document.getElementById("item_template").innerHTML);
```
- probably make some sense to review with partials

## Working with local storage

```
function setPerson(personToSave) {
  localStorage.setItem('person', JSON.stringify(personToSave));
}

function getPerson() {
  return JSON.parse(localStorage.getItem('person'));
}
```

## Constructor Functions and Object Prototypes
What is a constructor function?

A regular function except that it is intended to be used with the `new` operator. When invoked with the `new` operator, a new object is created upon invocation, and all references of `this` in the function refer to this new object. The function returns the object unless there is an explicit return.

What is a prototype?

An object from which other objects have been created.

```
var foo = {
  a: 1,
  b: 2
};

var bar = Object.create(foo);
bar.__proto__ === foo; // true
```

Can chain prototypes together.

Can check if `foo` is prototype of `bar`.
```
foo.isPrototypeOf(bar); // true
```

Find out the prototype of `bar`
```
Object.getPrototypeOf(bar); // foo
```

If an object is not created from a prototype, then `Object.prototype` will be its prototype. That is because `Object.prototype` is at the end of the prototype chain of all prototypes.

When accessing a method or property on an object, it will check not only the object, but all objects on its prototype chain until the end is reached (the end being `Object.prototype`).

Some people call this "Prototypal Inheritance". It's also known as "Behavior Delegation", since objects downstream on the chain can delegate properties to objects higher up on the chain.

Shared behaviors can be overriden by defining a property of the same name on an object lower in the chain.

You can check whether or not a given property is defined on the object itself (as opposed to on its prototype chain), by using the `hasOwnProperty` method:

```
var foo = {
  a: 1
};

foo.hasOwnProperty('a') // true
```

Can also get an array of an object's own property names using the `Object.getOwnPropertyNames` method:

```
Object.getOwnPropertyNames(foo); // ['a']
```

These methods are all inherited from the `Object.prototype`. Another useful one is:
`Object.prototype.toString()` which returns a string representation of an object.

### Functions and Prototypes
Every function has a special `prototype` property, which is a prototype object. Generally referred to as the "constructor function's prototype object". Only useful when its a constructor, as this will be the prototype of all objects it creates (note that it is not the prototype of the constructor itself i.e. `Foo.__proto__ !== Foo.prototype`). If you call the `Object.getPrototypeOf` method on an object, it will return the `prototype` property of the constructor function.

```
// Given:
var bar = new Foo();

Object.getPrototypeOf(bar) === Foo.prototype; // true
bar.__proto__ === Foo.prototype; // true 
```

Also, all objects created this way will also have a `constructor` property that point back to the constructor function. I.e. `bar.constructor === Foo // true`

Even function objects created will have as their prototype the prototype property of their constructor function. 


### Prototype Pattern of object creation
Another way to think of the inside of a `new` operator invocation is `Object.create(Foo.prototype)`. So a new object is created on the function's prototype property. We can now define new methods and properties on the prototype, and all objects that have the prototype on their prototype chains will be able to delegate those behaviors to the prototype.

So generally speaking:
```javascript
var bar = new Foo();
// is the same as
var bar = Object.create(Foo.prototype);
```
This of course assumes that `Foo` doesn’t define any properties of the object in order for the above to create the same type of object.

## Pseudo-classical pattern and the OLOO pattern
Purpose of these object creation patterns is to have objects encapsulate their own state, but share behaviors.

Pseudo-classical creates an object using the `new` operator with a constructor function and then defines shared behaviors on the prototype.

```
function Foo(x, y) {
  this.x = x || 0;
  this.y = y || 0;
}

Foo.prototype.diff = function() {
  return this.x - this.y;
}

var bar = new Foo(4, 5);
bar.diff(); // -1
```

OLOO Pattern

"Objects Linking to Other Objects Pattern"

Uses `Object.create` to inherit directly from an object, without bothering with constructors and their prototypes. The other object is what the new object's __proto__ property will point at.

```

var Foo = {
  x: 0,
  y: 0,
  diff: function() {
    return this.x - this.y;
  },
  init: function(x, y) {
    this.x = x || 0;
    this.y = y || 0;
    return this;
  }
}

var baz = Object.create(Foo).init(4, 5);
baz.diff(); // -1
```

Also can use `Object.create` in conjunction with `Object.getPrototypeOf`, to create a new prototype which inherits from an existing object.
