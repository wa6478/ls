// Factory Functions aka Factory Object Creation Pattern

function createPerson(firstName, lastName) {
  var person = {}

  person.firstName = firstName;
  person.lastName = lastName || '';
  person.fullName = function() {
    return (this.firstName + " " + this.lastName).trim();
  }

  return person;
}

var john = createPerson("John", "Doe");
john.fullName(); // "John Doe"

// Alternatively using an object literal

function createPerson(firstName, lastName) {
  return {
    firstName: firstName,
    lastName: lastName || '',
    fullName: function() {
      return (this.firstName + " "+ this.lastName).trim();
    }
  };
}

// Disadvantage of factory functions
// - every object has all of the methods (redundant)
// - no way to know whether or not an object is from a factory function

// Rewrite the code below to use object-literal syntax to generate the returned object:

function makeObj() {
  var obj = {};
  obj.propA = 10;
  obj.probB = 20;
  return obj;
}

// Solution:

function makeObj() {
  return {
    propA: 10,
    propB: 20
  };
}


