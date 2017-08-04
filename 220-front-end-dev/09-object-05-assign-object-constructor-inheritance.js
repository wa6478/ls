// function Vehicle() {
//   this.doors = 4;
//   this.wheels = 4;
// }

// var sedan = new Vehicle;
// var coupe = new Vehicle;

// coupe.doors = 2;

// console.log(sedan);
// console.log(sedan.hasOwnProperty("doors"));
// console.log(coupe);
// console.log(coupe.hasOwnProperty("doors"));

// function Coupe() {};
// Coupe.prototype = new Vehicle


var arr = [];
// same as
var arr = new Array();

var obj = {};
// same as
var obj = new Object();

function Vehicle() {

}

// constructors are just like any other functions except for the capitalization convention

// when invoked with `new`, it will create an object that is an instance of the constructor

function Vehicle() {
  if (!(this instanceof Vehicle)) {
    return new Vehicle();
  }

  return this;
}

Vehicle.prototype = {
  doors: 4,
  wheels: 4
};

var sedan = Vehicle();
var coupe = new Vehicle();

coupe.doors = 2;

function Coupe() {
  if (!(this instanceof Coupe)) {
    return new Coupe();
  }

  return this;
}

Coupe.prototype = new Vehicle();
Coupe.prototype.doors = 2;


function Motorcycle() {
  var o = this;
  if (!(o instanceof Motorcycle)) {
    o = new Motorcycle();
  }

  o.doors = 0;
  o.wheels = 2;
  return o;
}

Motorcycle.prototype = new Vehicle();

var monster = new Motorcycle();
var crx = new Coupe();

crx instanceof Coupe // true
crx instanceof Vehicle // 

function Sedan() {
}

Sedan.prototype = Object.create(Vehicle.prototype);

var lesabre = new Sedan();

var prototype_car = {
  doors: 5,
  wheels: 3
};

var ceo_car = Object.create(prototype_car);

ceo_car.doors = 7;
console.log(ceo_car.doors);
console.log(prototype_car.doors);

