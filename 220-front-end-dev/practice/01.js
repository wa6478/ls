function makeMultipleLister(number) {
  return function() {
    var total = number;
    while (total < 100) {
      console.log(total);
      total += number;
    }
  };
}