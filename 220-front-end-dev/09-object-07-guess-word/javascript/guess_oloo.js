// Object Linking to Other Objects (OLOO) Solution

// var  Game = {
//   defaultState: 0,

//   behavior: function() {},

//   init: function(x) {
//     this.defaultState: x;
//   }
// }

// Don't have to mess with the constructor function's prototye to add shared behaviors
// Can simply set the states by invoking the `init` method on the object and passing it the desired states

$message = $("#message");
$replay = $("#replay");
$spaces = $("#spaces");
$guesses = $("#guesses");
$apples = $("#apples");

// Random Word Function 

var randomWord = (function() {
  var words = ["banana", "apple", "pear", "lemon"];

  return function() {
    var randomIndex = Math.floor(Math.random() * words.length);
    return words.splice(randomIndex, 1)[0];
  }
})();

function nonLetter(letter) {
  return letter < "a" || letter > "z";
}

var Game = {
  // messaging
  displayMessage: function(message) {
    $message.text(message);
  },
  // resets and setup
  hideReplay: function() {
    $replay.hide();
  },
  showReplay: function() {
    $replay.show();
  },
  resetBlanks: function() {
    $spaces.find("span").remove();
  },
  resetGuesses: function() {
    $guesses.find("span").remove();
  },
  clearMessage: function() {
    this.displayMessage("");
  },
  resetBackground: function () {
    this.changeBackground("");
  },
  resetApples: function() {
    $apples.removeClass();
  },
  selectWord: function() {
    var word = randomWord();
    if (word) {
      this.selectedWord = word.split("");
    } else {
      this.displayMessage("Sorry out of words!");
    }
  },
  createBlanks: function() {
    var length = this.selectedWord.length;
    for (var i = 1; i <= length; i++) {
      $("<span />").appendTo($spaces);
    }
  },
  unbind: function() {
    $(document).off("keypress");
  },
  changeBackground: function(condition) {
    $("body").removeClass().addClass(condition);
  },
  // game logic
  duplicateGuess: function(letter) {
    return this.guessedLetters.indexOf(letter) >= 0;
  },
  addToGuessedLetters: function(letter) {
    this.guessedLetters.push(letter);
    $("<span />").text(letter).appendTo($guesses);
  },
  correctGuess: function(letter) {
    return this.selectedWord.indexOf(letter) >= 0;
  },
  updateBlanks: function(letter) {
    var length = this.selectedWord.length;
    for (var i = 0; i <= length; i++) {
      if (this.selectedWord[i] === letter) {
        $spaces.find("span").eq(i).text(letter);
        this.correctSpaces++;
      }
    }
  },
  incrementIncorrect: function() {
    this.incorrectCount++;
    $apples.removeClass().addClass("guess_" + this.incorrectCount);
  },
  checkWin: function() {
    return this.selectedWord.length === this.correctSpaces;
  },
  checkLose: function() {
    return this.incorrectCount === this.maxWrongGuess;
  },
  gameOver: function() {
    this.unbind();
    this.showReplay();
  },
  win: function() {
    this.displayMessage("You guessed it!");
    this.changeBackground("win");
  },
  lose: function() {
    this.displayMessage("You are out of guesses!");
    this.changeBackground("lose");
  },
  evaluateGameState: function() {
    if (this.checkWin()) {
      this.gameOver();
      this.win();
    }

    if (this.checkLose()) {
      this.gameOver();
      this.lose();
    }
  },
  processGuess: function(letter) {
    // ignore duplicate guesses
    if (this.duplicateGuess(letter)) { return; }

    this.addToGuessedLetters(letter);

    if (this.correctGuess(letter)) {
      this.updateBlanks(letter);
    } else {
      this.incrementIncorrect();
    }

    this.evaluateGameState();
  },
  processInput: function(e) {
    var inputChar = e.key;
    if (nonLetter(inputChar)) { return; }
    this.processGuess(inputChar);
  },
  bindKeypress: function() {
    $(document).on("keypress", this.processInput.bind(this));
  },
  // game orchestration
  reset: function() {
    this.selectedWord = "";
    this.incorrectCount = 0;
    this.correctSpaces = 0;
    this.guessedLetters = [];
    this.maxWrongGuess = 6;
    this.hideReplay();
    this.resetBlanks();
    this.resetGuesses();
    this.resetBackground();
    this.resetApples();
    this.clearMessage();
  },
  setup: function() {
    this.selectWord();
    this.createBlanks();
  },
  init: function() {
    this.reset();
    this.setup();    
    this.bindKeypress();
    return this;
  }
}
var game = Object.create(Game).init();

$replay.on("click", function(e) {
  e.preventDefault();
  game = Object.create(Game).init();
});
