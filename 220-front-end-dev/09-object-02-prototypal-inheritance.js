// Write a function that returns the object on a given object's prototype chain where a property is defined. See the example code below:

// function getDefiningObject(object, propKey) {
//   var definingObject;

//   while (!object.hasOwnProperty(propKey)) {
//     if (object === Object.prototype) {
//       object = null;
//       break;
//     }

//     object = Object.getPrototypeOf(object);
//   }

//   return object;
// }

// alternate per solution
// leverages the fact that trying to get the prototype of `Object.prototype` returns null, so setting it to `null` manually isn't necessary

function getDefiningObject(object, propKey) {
  var definingObject;

  while(object && !object.hasOwnProperty(propKey)) {
    object = Object.getPrototypeOf(object);
  }

  return object;
}

var foo = {
  a: 1,
  b: 2
};

var bar = Object.create(foo);
var baz = Object.create(bar);
var qux = Object.create(baz);

bar.c = 3;

console.log(getDefiningObject(qux, 'c') === bar);     // true
console.log(getDefiningObject(qux, 'e'));             // null

// Write a function to provide a shallow copy of an object. The copied object should share the same prototype chain as the original object, and it has the same own properties that return the same values or objects when accessed. Use the code below to verify your implementation:

function shallowCopy(object) {
  var result = Object.create(Object.getPrototypeOf(object));
  for (var property in object) {
    if (Object.prototype.hasOwnProperty.call(object, property)) {
      result[property] = object[property];
    }
  }

  return result;
}

var foo = {
  a: 1,
  b: 2
};

var bar = Object.create(foo);
bar.c = 3;
bar.say = function() {
  console.log("c is " + this.c);
}

var baz = shallowCopy(bar);
console.log(baz.a);       // 1
baz.say();                // c is 3

// Write a function that extends an object (destination object) with contents from multiple objects (source objects).

function extend(destination) {
  var args = Array.prototype.slice.call(arguments, 0);
  var destination = args[0];
  var sources = args.slice(1);

  sources.forEach(function(source) {
    for (var property in source) {
      if (Object.prototype.hasOwnProperty.call(source, property)) {
        destination[property] = source[property];
      }
    }
  });

  return destination;
}

var foo = {
  a: 0,
  b: {
    x: 1,
    y: 2
  }
};

var joe = {
  name: 'Joe'
};

var funcs = {
  sayHello: function() {
    console.log('Hello, ' + this.name);
  },

  sayGoodBye: function() {
    console.log('Goodbye, ' + this.name);
  }
};

var object = extend({}, foo, joe, funcs);

console.log(object.b.x);          // 1
object.sayHello();                // Hello, Joe