setTimeout(callback, delay) invokes a Function after the specified number of milliseconds.

setInterval(callback, delay) invokes a Function repeatedly in intervals of some specified number of milliseconds. clearInterval clears the interval and prevents future invocations of the Function.

An event is an object that represents some occurrence and contains a variety of information about what and where it happened. The browser triggers some events as it loads a page and when it accomplishes some actions directed by an application. The user also triggers events when he interacts with the page.

Code that must access the DOM should be invoked after the DOMContentLoaded event fires on document.

User events drive most user interfaces and can result from a user interacting with the keyboard, mouse, touchscreen, window, and other devices. Examples of these user events are click, mouseover, keydown, and scroll.

Event listeners are callbacks that the browser will invoke when a matching event occurs.

element.addEventListener registers an event listener. You can also use specific GlobalEventHandlers like element.onclick, to register an event handler.

The Event object provides the useful properties type, target, and currentTarget.

Keyboard events have properties which and key (and others) that describe the keys the user pressed. Mouse events similarly provide button, clientX, and clientY.

There are three phases to firing events: capturing, target, and bubbling.

event.preventDefault() prevents default browser behavior in response to an event. event.stopPropagation() stops the current capturing or bubbling phase, which prevents the event from firing on containing or contained elements.

Event delegation is a technique used to handle events triggered by multiple elements using a single event handler.