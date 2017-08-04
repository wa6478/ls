// Write a constructor function Circle that takes a radius argument that can create circle objects. You should be able to call an area on the created objects to get a circle's area. Test your implementation with the following code:

// function Circle(radius) {
//   this.area = function() {
//     return Math.PI * Math.pow(radius, 2);
//   };
//   this.circumference = function() {
//     return 2 * Math.PI * radius;
//   };
// }

// alternatively, by using Prototype Pattern

// function Circle(radius) {
//   this.radius = radius;
// }

// Circle.prototype.area = function() {
//   return Math.PI * Math.pow(this.radius, 2);
// }

// var a = new Circle(3);
// var b = new Circle(4);

// console.log(a.area().toFixed(2)); // 28.27
// console.log(b.area().toFixed(2)); // 50.27


// Implement the method described in the comments below:

// function Ninja(){
//   this.swung = false;
// }

// var ninjaA = new Ninja();
// var ninjaB = new Ninja();

// // Add a swing method to the Ninja prototype which
// // returns itself and modifies swung

// Ninja.prototype.swing = function() {
//   this.swung = true;
//   return this;
// };

// console.log(ninjaA.swing().swung)      // this needs to be true
// console.log(ninjaB.swing().swung)      // this needs to be true


// In this problem, we'll ask you to create a new instance of an object, without having direct access to the constructor function:

var ninjaA = (function() {
  function Ninja(){};
  return new Ninja();
})();

// create a ninjaB object

// using constructor function

var ninjaB = new ninjaA.constructor();

// using Object.create

var ninjaC = Object.create(ninjaA);

console.log(ninjaB.constructor === ninjaA.constructor)    // this should be true
console.log(ninjaC.constructor === ninjaA.constructor)    // this should be true
console.log(ninjaB.constructor === ninjaC.constructor)    // this should be true
