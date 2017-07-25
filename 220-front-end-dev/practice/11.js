document.addEventListener("DOMContentLoaded", function() {
  var answer;
  var form = document.querySelector("form");
  var input = document.getElementById("guess");
  var display = document.querySelector("p");
  var link = document.querySelector("a");
  var submitButton = document.querySelector("fieldset").lastElementChild;
  var guesses = 0;
  var message;

  form.addEventListener("submit", function(event) {
    event.preventDefault();
    var guess = parseInt(input.value, 10);

    if (validGuess(guess)) {
      guesses++;
      if (guess > answer) {
        message = "answer lower than " + guess;
      } else if (guess < answer) {
        message = "answer higher than " + guess;
      } else if (guess === answer) {
        message = "you got it - " + guesses + " guesses";
        // submitButton.setAttribute("disabled", "");
        submitButton.disabled = true;
      }
    } else {
      message = "invalid number";
    }

    display.textContent = message;

    function validGuess(number) {
      return number > 0 && number < 101 && Number.isNaN(number) === false;
    }
  });

  link.addEventListener("click", function(event) {
    event.preventDefault();
    newGame();
  });

  function newGame() {
    submitButton.disabled = false;
    form.reset();
    guesses = 0;
    answer = randomNumberBetween(1, 100);
    message = "guess a number";
    display.textContent = message;
  }
  
  newGame();
});

function randomNumberBetween(min, max) {
    var range = max - min + 1;
    var random = Math.floor(Math.random() * range) + min;
    return random;
  }