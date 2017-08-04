// Array methods
// first, return the first element in an array.
// last, return the last element in an array.
// without, return a new array that does not contain the value passed to it.
// range, return an array of values starting at 0 when a single number is supplied. If two arguments are supplied, returns an array of values that start with the first argument and ends with the second value.
// lastIndexOf, return the last index of the supplied value.
// sample, return a single value from an array when no argument is supplied. Return an array of multiple, non-repeated elements when a quantity is supplied.

// Object methods
// findWhere, return the first object with properties that match the supplied object. If no objects match all the supplied properties, undefined is returned.
// where, return an array of all objects with properties that match the supplied object.
// pluck, return an array of the values that match the supplied key from a collection of objects.
// keys, return an array of the keys from an object.
// values, return an array of the values from an object.
// extend, takes two or more objects, taking the properties and values from the last argument and adding them to the argument before it. Object extensions occur recursively from last argument to first. The first argument ends up being modified to include all properties and values from the other objects passed in.
// pick, return a new object with the passed in properties taken from the old object. Accepts one or more arguments.
// omit, return a new object with any passed in properties omitted.
// has, return true when the property passed in exists, false if it doesn't.


// Utility methods. These should work with either syntax (i.e. _.isElement(ob) or _(obj).isElement()).

// isElement, return true if argument is a DOM element.
// isArray, return true if argument is an array.
// isObject, return true if argument is an object or a function.
// isFunction, return true if argument is a function.
// isString, return true if argument is a string.
// isNumber, return true if argument is a number. Also returns true for objects created with the Number constructor.
// isBoolean, return true if argument is a boolean. Also returns true for objects created with the Boolean constructor.

(function() {

  var findObjs = function(element, props, multiple) {
    var match = multiple ? [] : undefined;

    element.some(function(obj) {
      var allMatch = true;

      for (var prop in props) {
        if(!(prop in obj) || obj[prop] !== props[prop]) {
          allMatch = false;
        }
      }

      if (allMatch) {
        if (multiple) {
          match.push(obj);
        } else {
          match = obj;
          return true; // return here allows us to exit the iteration early which we can't do with a `forEach` loop
        }
      }
    });

    return match; 
  }

  var _ = function(element) {
    u = {
      first: function() {
        return element[0];
      },
      last: function() {
        return element[element.length - 1];
      },
      without: function(withheld) {
        var args = Array.prototype.slice.call(arguments);
        return element.filter(function(el) {
          return !args.some(function(arg) {
            return arg === el;
          });
        });
      },
      lastIndexOf: function(value) {
        return (element.length - 1) - element.reverse().indexOf(value);
      },
      sample: function(count) {
        function getRandomIdx(array) {
          return Math.floor(Math.random() * (array.length));
        }

        if (!count) {
          return element[getRandomIdx(element)];
        }

        var result = [];
        var copy = element.slice();
        for (var i = 1; i <= count; i++) {
          var idx = getRandomIdx(copy);
          result = result.concat(copy.splice(idx, 1));
        }

        return result;
      },
      findWhere: function(objectWithProperties) {
        return findObjs(element, objectWithProperties, false);
        // Own code prior to viewing solution
        // var idx;

        // for (var i = 0; i < element.length; i++) {
        //   for (var property in objectWithProperties) {
        //     if (element[i][property] === objectWithProperties[property]) {
        //       idx = i;
        //     } else {
        //       idx = undefined;
        //       break;
        //     }
        //   }

        //   if (idx >= 0) {
        //     break;
        //   }
        // }

        // return element[idx];
      },
      where: function(objectWithProperties) {
        return findObjs(element, objectWithProperties, true);

        // Own code prior to viewing solution:
        // var result = element.filter(function(el) {
        //   var match = false;
        //   for (var property in objectWithProperties) {
        //     if (el[property] === objectWithProperties[property]) {
        //       match = true;
        //     } else {
        //       match = false;
        //       break;
        //     }
        //   }

        //   return match;
        // });

        // return result;
      },
      pluck: function(key) {
        var result = [];

        element.forEach(function(el) {
          if (el[key]) {
            result.push(el[key]);
          }
        });

        return result;
      },
      keys: function() {
        // return Object.getOwnPropertyNames(element);
        // more imperative approach per solution below

        var keys = [];

        for (var prop in element) {
          keys.push(prop);
        }

        return keys;
      },
      values: function() {
        // var result = [];
        // var keys = this.keys();
        // for (var property in element) {
        //   if (keys.indexOf(property) >= 0) {
        //     result.push(element[property]);
        //   }
        // }

        // return result;

        // Simplified version below per solution
        // the whole step of retrieving the keys was unnecessary if all I want is all the values
        var result = [];

        for (var property in element) {
          result.push(element[property]);
        }

        return result;
      },
      pick: function() {
        var args = Array.prototype.slice.call(arguments);
        var result = {};

        for (var property in element) {
          if (args.indexOf(property) >= 0) {
            result[property] = element[property];
          }
        }

        return result;
      },
      omit: function() {
        var result = {};
        var args = Array.prototype.slice.call(arguments);

        for (var prop in element) {
          if (args.indexOf(prop) >= 0) {
            continue
          }

          result[prop] = element[prop];
        }

        return result;
      },
      has: function(property) {
        return {}.hasOwnProperty.call(element, property);
        // return !!element[property];
      },
      isElement: function() {
        // return !!element.tagName;
        return element && element.nodeType === 1;
      },
      isArray: function() {
        // return Array.isArray(element);
        return toString.call(element) === "[object Array]";
      },
      isObject: function() {
        // return typeof element === "function" || typeof element === "object";
        var type = typeof element;

        return type === "function" || type === "object" && !!element;
      },
      isFunction: function() {
        return typeof element === "function";
      },
      isBoolean: function() {
        // return element === true || element == false;
        return toString.call(element) === "[object Boolean]";
      },
      isString: function() {
        // return typeof element === "string" || typeof element.valueOf() === "string";
        return toString.call(element) === "[object String]";
      },
      isNumber: function() {
        // return typeof element === "number" || typeof element.valueOf() === "number";
        return toString.call(element) === "[object Number]";
      }

    };

    return u;
  }

  // solution appens the isElement, etc. functions to the u object, by iterating over an array with the function names, and having them call the corresponding _[method]
  // certainly saves some repetition

  _.range = function(arg1, arg2) {
    var result = [];
    if (arg2) {
      for (var i = arg1; i < arg2; i++) {
        result.push(i);
      }
    } else {
      for (var j = 0; j < arg1; j++) {
        result.push(j);
      }
    }

    return result;
  };

  _.extend = function() {
    var args = Array.prototype.slice.call(arguments);
    var oldObj = args.pop()
    var newObj = args[args.length - 1];

    for (var prop in oldObj) {
      newObj[prop] = oldObj[prop];
    }

    return args.length === 1 ? newObj : _.extend.apply(_, args);

    // My initial approach just iterates through all additional objects in the arguments and adds them to the first one
    // var args = Array.prototype.slice.call(arguments);
    // var first = args.shift();

    // args.forEach(function(object) {
    //   for (var property in object) {
    //     first[property] = object[property];
    //   }
    // });

    // return first;
  };

  _.isElement = function(el) {
    return _(el).isElement();
  };

  _.isArray = function(el) {
    return _(el).isArray();
  };

  _.isObject = function(el) {
    return _(el).isObject();
  };

  _.isFunction = function(el) {
    return _(el).isFunction();
  };

  _.isBoolean = function(el) {
    return _(el).isBoolean();
  };

  _.isString = function(el) {
    return _(el).isString();
  }

  _.isNumber = function(el) {
    return _(el).isNumber();
  }

  window._ = _;
})();