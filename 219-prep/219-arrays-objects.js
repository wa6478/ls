// Arrays

// push
// syntax: arr.push([el1[, ...[, elN]]]);
// side effects: mutates array by adding one or more elements to the end of an array
// return value: the new length of the array
// note: relies on length property of Array to determine where to start inserting values

// pop
// syntax: arr.pop();
// side effects: mutates array by removing the last element of the array
// return value: value of element removed, or undefined if called on an empty array
// note: uses the length property of the array to shorten it

// shift
// syntax: arr.shift();
// side effects: remove the first element of the array
// return value: the value of the element removed, undefined if called on an empty array
// note: changes the length of the array

// unshift
// syntax: arr.unshift([el1[, ... [, elN]]]);
// side effects: mutates the array by adding one or more element to the beginning of the array
// return value: length of the array (the value of its length property)

// indexOf
// syntax: arr.indexOf(element[, fromIndex])
// side effects: none
// return value: positive integer representing the first index at which the passed in element is found starting at 0 or at the passed in optional argument, -1 if not present

// lastIndexOf
// syntax: arr.lastIndexOf(element[, fromIndex])
// side effects: none
// return value: positive integer representing the last position of an element in the array, -1 if not present

// slice
// syntax: arr.slice(startIndex [, endIndex]);
// side effects: none
// return value: a new array consisting of the elements captured as part of the slice
// note: extracts up to but not including the end, and can use negative index to use as an offset from the back of the sequence
// note2: does not mutate -- returns a shallow copy

// splice
// syntax: arr.splice(start, [deleteCount[, el1[, elN]]])
// side effects: mutates the array. Removes items from the indicated index, and inserts new elements if provided
// return value: new array containing the deleted items
// note: can use negative start to indicate end of array
// note2: if delete count is omitted, all elements through the end will be deleted

// concat
// syntax: arr.concat(arr2) // or // arr.conact(val1 [, val2[, valN]])
// side effects: none
// return value: new array (shallow copy) consisting of the concatenated array

// join
// syntax: arr.join(delimiter) 
// side effects: none
// return value: a string primitive type that consists of the elements from the array delimited by the value passed in as the delimiter argument

// list processing strategies:

// every
// syntax: arr.every(callback(currentValue, idx, arr));
// side effects: none
// return value: boolean based on whether or not all iterations passed to the callback function returned true

// some
// syntax: arr.some(callback(currentValue, idx, arr));
// side effects: none
// return value: boolean based on whether or not any of the elements returned true for the test function

// filter
// syntax: arr.filter(callback(currentValue, idx, arr));
// side effects: none
// return value: new array consisting of elements for which the callback function returned true

// forEach
// syntax: arr.forEach(callback(currentValue, idx, arr));
// side effects: none
// return value: undefined
// note: simply iterates through the array, passing to the callback function the arguments for each element in the array

// map
// syntax: arr.map(callback(currentValue, idx, arr));
// side effects: none
// return value: a new array consisting of the return value of the callback function for each element in the original array

// reduce
// syntax: arr.reduce(callback(accumulator, currentValue, idx, array), initialValue);
// side effects: none
// return value: accumulator
// callback should return what to do with the sum, whether to add to it, or assign it to a certain value
// if no initial value is given, sum starts out as first element in array, and callback is called starting with second element in the array
// if an initial value is given, iteration begins with the first element in the array

// find
// syntax arr.find(callback(el, idx, array))
// side effects: none
// return value: returns the first element for which the callback function returns true
// note: similar to findIndex except that it returns the element instead of the index

// don't use arithmetic operators on arrays
// comparison operators are useless since you are comparing objects not contents

// Objects

// object properties

  // property name can be any valid string

var object = {
  a: 1, // a is string with quotes omitted
  'foo': 2 + 1, // property name with quotes
  'two words': 'this is fine', // two word string as name
  b: { // object as property value
    name: 'Dude',
    gender: 'Alien', 
  },
  c: function() {  // function expression as property value
    return 'say something';
  }
}

// accessing object properties

object.a; // 1
object['a']; // 1
object.d; // undefined when it doesn't exist
object.c(); // calling the method 'c'
var dude = 'a';
object[dude]; // bracket notation can take expressions
  // JS style guide prefers dot notation over bracket notation

// deleting object property

delete object.b // delete is a reserved keyword

// stepping through

for (obj in object) {
  console.log(obj); // logs property name
  console.log(object[obj]); // logs property value
}

// retrieve names of all properties in an Object as array

Object.keys(object); // ['a', 'b', 'c' ...]

// Strings

// String.fromCharCode
// syntax: String.fromCharCode(unicode);
// return value: a string of specified unicode values

// charCodeAt
// syntax: str.charCodeAt(idx);
// return value: unicode value for the character at index

// match
// syntax: str.match(/regexp/)
// return value: array of any matches

// substr
// syntax: str.substr(start, length)
// return value: substring starting at start index as long as length
// note: can use negative value to denote index from end of string

// substring
// syntax: str.substring(start[, end])
// return value: substring starting at start index up to but not including end index
// note: if end index is omitted, grabs characters through end of string