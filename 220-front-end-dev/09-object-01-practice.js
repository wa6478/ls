// What are the two principal disadvantages of working with factory functions?

// 1 - each object has a copy of the full set of methods, which can cause redundancy
// 2 - can't tell whether or not an object was returned from a given function

// Rewrite the code below to use object-literal syntax to generate the returned object:

function makeObj() {
  var obj = {};
  obj.propA = 10;
  obj.probB = 20;
  return obj;
}

//

function makeObj() {
  return {
    propA: 10,
    probB: 20
  }
}

//