Questions:

## What is the DOM?
DOM stands for Document Object Model. An in-memory object representation of an HTML documents. It consists of a hierarchy of nodes that make up the different elements, text content, and HTML comments found on a web page. JavaScript has access to these nodes and is able to manipulate and work with these nodes to build desired experiences.

## How is the DOM different from the HTML?
The DOM is an object, and may include nodes that are not present on the HTML. For example, if the HTML were to omit a `head` or `body` tag, the DOM would still insert those element nodes. Also, whitespace between tags will be interpreted by the DOM as empty nodes.

## What is an empty node?
Empty nodes are text nodes representing whitespace that is part of the DOM when it interprets an HTML file. This generally tends to be things like the whitespace between two HTML elements such as a line break or indentation. However, the DOM still interprets the space as text. Technically, they are just the same as any other text node, they just happen to have nothing but whitespace in them, and are often a source of a particular type of frustration and bugs which is why developers think about them separately at all. They can appear pretty much anywhere.

## How can you figure out what kind of object a given node is?
Generally, you can use `node.toString()` to determine the node type (e.g. `[object HTMLParagraphElement]`). However this is not implemented consistently for all nodes. Therefore it may be useful to call the `node.constructor` property which can also reveal the node type (e.g. `function HTMLAnchorElement() { [native code] }`).

## How are nodes connected?
Nodes are connected to each other via properties. Parent nodes know about their child nodes collectively (`childNodes`), and also specifically their first and last children, and can further specify element children as opposed to other types of children. Child nodes know about their parent nodes, as well as their sibling nodes. 

## What is the event loop?
Event loop is a process that JavaScript runs whenever the stack is empty, and checking if there are any callback functions that have been added to the task/message queue that can be added to the stack.

## What is an event?
An event is an object that represents some occurence. It contains information about what happened and where it happened. Such as activity by the user (e.g. click, scroll) (`type` property of the event), or state of the document (such as when the DOM has finished loading). They are passed to the event handler where a callback is triggered, and can be interrogated for more information about the event. Can access the event's target with the `target` property of the event object.

## What are event listeners?
Event listeners (aka event handlers) are callbacks that are invoked when a given event occurs. They can be added to nodes in the DOM that check for a specific event on that node. Adding an event listener to a node is referred to as registering an event listener. When the event occurs, the callback is invoked with the event as an argument.

## What are `GlobalEventHandlers`?
They are similar to event listeners, and are properties of nodes that can be assigned the callback you want to execute when a given event fires. (E.g. `node.onclick`)

Four steps to add an event listener:
1. Identify the event you need to handle
2. Identify the element that will receive the event
3. Define a function to call when this event occurs
4. Register the function as an event listener

## What is event delegation?
Adds an event listener to a container element and listens for and handles events that fire on the container's child elements. Solves the problem of having to attach an event listener to every element. For example, we can attach an event listener to the document, and interrogate the event object's target (`event.target`) to figure out which child of the document was targeted, and perform a desired action. It utilizes the capturing and bubbling phases of event firing.

## What is event capturing and bubbling?
The capturing and bubbling phases are what enable event delegation. As an event fires on a target element, it will also fire on each parent element of the target on its way down to the target. This is the capturing phase. When the event fires on the actual target, this is the target phase. Then it goes back up the DOM hierarchy, firing the event on every parent element on its way up -- this is the bubbling phase. In summary there are three phases to an event firing: capturing, target, and bubbling.

## What is asynchronous code?
Fundamentally, asynchronous code is not synchronous code, which runs one line of code at a time until it finishes. Sequential code, where each line of code runs in a sequence, is a type of synchronous code. Asynchronous code on the other hand, does not necessarily run each line in sequence or continously, and parts of the code may run at a later time. The implication is that we must not only reason about what the code does but when it does it.

Asynchronous means code that is evaluated outside of the normal execution of a JavaScript program. This is accomplished by the browser being able to add code to the task queue which is added to the stack when the stack is empty.

## What is `event.stopPropagation()` used for?
It's used to prevent further bubbling or capturing (depending on how the listener was set up). This is used in delegation where once we hit our target element and execute some code, we want to make sure it doesn't affect any parent elements above it.

## What is `event.preventDefault()` used for?
Used to prevent the default browser behavior when a certain event occurs. For example, when used on a node that represents an anchor element, it would prevent the code from following the link. This is useful when you want to utilize the clicking of the anchor element to do other things on the page which you specify in your callback function.

## Why is `DOMContentLoaded` useful?
It's an event that fires when the DOM is loaded, and is useful as an event to handle to execute further code that works with the DOM. This makes sure that this code does not run until the DOM has loaded.

## What does `setTimeout` do?
It invokes a function after a specified amount of time has elapsed.

## What does `setInterval` do?
Invokes a function every time a specified interval has elapsed. `clearInterval` halts the interval and prevents future invocation of the function.

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

## What is a higher order function?
A function that uses a function as argument or returns another function.

## How does garbage collection work in JavaScript?
When data in memory is no longer accessible by the code, it becomes eligible for garbage collection. To no longer be accessible, there must be no variables or pointers in the code point at that data. When data is garbage collected, it frees up memory to be available.

## How do closures enable the use of private data?
Closures close over the variables accessible at function definition. If a function creates an object that is within the closure, that object will have access to the variables that are closed over, assuming it has methods to access those variables. This makes those variables inaccessible by any means other than the object's methods.

## What is an immediately invoked function expression (IIFE) and why is it useful?
An immediately invoked function expression is one that is defined and immediately invoked with `()` after the definition. This can be useful because they create their own scopes and in a large JavaScript project where you don't want accidentally overwrite variables, this can be a handy pattern.


