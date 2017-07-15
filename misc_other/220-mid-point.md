Questions:

## What is the DOM?
DOM stands for Document Object Model. An in-memory object representation of an HTML documents. It consists of a hierarchy of nodes that make up the different elements, text content, and HTML comments found on a web page. JavaScript has access to these nodes and is able to manipulate and work with these nodes to build desired experiences.

## What is an empty node?
Empty nodes are text nodes representing whitespace that is part of the DOM when it interprets an HTML file. This generally tends to be things like the whitespace between two HTML elements such as a line break or indentation. However, the DOM still interprets the space as text. Technically, they are just the same as any other text node, they just happen to have nothing but whitespace in them, and are often a source of a particular type of frustration and bugs which is why developers think about them separately at all. They can appear pretty much anywhere.

## What is the event loop?
Event loop is a process that JavaScript runs whenever the stack is empty, and checking if there are any callback functions that have been added to the task/message queue that can be added to the stack.

## What is an event?
An event is when the browser notes activity by the user (e.g. click, scroll), or state of the document (such as when the DOM has finished loading). These events can be used to trigger different actions.

## What are event listeners?
Event listeners (aka event handlers) are functions that are called when a given event occurs. They can be added to nodes in the DOM that check for a specific event on that node. When the event occurs, an event listener will fire a callback.

Four steps to add an event listener:
1. Identify the event you need to handle
2. Identify the element that will receive the event
3. Define a function to call when this event occurs
4. Register the function as an event listener

## What is event delegation?
Adds an event listener to a container element and listens for and handles events that fire on the container's child elements. Solves the problem of having to attach an event listener to every element. 

## What is event capturing and bubbling?
The capturing and bubbling phases are what enable event delegation. As an event fires on a target element, it will also fire on each parent element of the target on its way down to the target. This is the capturing phase. When the event fires on the actual target, this is the target phase. Then it goes back up the DOM hierarchy, firing the event on every parent element on its way up -- this is the bubbling phase.

## What is asynchronous code?
Fundamentally, asynchronous code is not synchronous code, which runs one line of code at a time until it finishes. Sequential code, where each line of code runs in a sequence, is a type of synchronous code. Asynchronous code on the other hand, does not necessarily run each line in sequence or continously, and parts of the code may run at a later time. The implication is that we must not only reason about what the code does but when it does it.

Asynchronous means code that is evaluated outside of the normal execution of a JavaScript program. This is accomplished by the browser being able to add code to the task queue which is added to the stack when the stack is empty.

## What is the difference between variable scope and execution context?
Variable scope are the variables that are accessible from a given point in the code. Execution context is the object on which a function or method is called on (the receiver), and informs what `this` points at. 

## What is `this` and how is it used?
`this` points at the object that is the receiver of the current execution context. 

## What is the global object?
Global object is the top level execution context. Variables and functions declared at the top level are properties of the global object.

## What does implicit function execution context mean?
Implicit function execution context is a context without an explicit receiver. In JavaScript this is the same as global context. When functions are called without an explicit receiver and therefore implicit, they default to the global context.

## What does explicit function execution context mean?
Explicit function execution context is when a specific context has been explicitly given to a function or method. For example, invoking an object's method executes in an explicit function execution context, because in order to invoke a method we must provide the object of which the method is a property.

Explicit function execution context can also be created by using the `call`, `apply`, and `bind` methods, which can be used to define the execution context at invocation.

## What is meant by context loss?
In certain cases, context is lost. This can cause undesirable behavior.

## What does it mean for functions to be "first-class"?
First-class functions are functions that can be used like any other object, stored in a variable, and used as arguments and return values of functions.

## How does garbage collection work in JavaScript?
When data in memory is no longer accessible by the code, it becomes eligible for garbage collection. To no longer be accessible, there must be no variables or pointers in the code point at that data. When data is garbage collected, it frees up memory to be available.

## How do closures enable the use of private data?
Closures close over the variables accessible at function definition. If a function creates an object that is within the closure, that object will have access to the variables that are closed over, assuming it has methods to access those variables. This makes those variables inaccessible by any means other than the object's methods.

## What is an immediately invoked function expression (IIFE) and why is it useful?
An immediately invoked function expression is one that is defined and immediately invoked with `()` after the definition.

