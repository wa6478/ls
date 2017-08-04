var $message = $("#message");
var $letters = $("#spaces");
var $guesses = $("#guesses");
var $apples = $("#apples");

// A function that picks a random word from an array of words. The function has to pick a different word every time it runs, and when it's out of words, it returns undefined
// How to start a new game. We'll need a Game constructor that can be used to create game objects.

// The randomWord() Function

// We'll need a function randomWord that can pick one word out at a time randomly. A picked word can't be picked again, and when all words are taken, return undefined. For example:

// // the words are: 'apple', 'banana', 'orange' and 'pear'

// randomWord();     // banana
// randomWord();     // pear
// randomWord();     // apple
// randomWord();     // orange
// randomWord();     // undefined
// Our function has to be able to have access to the words array defined outside of it, and with each call of the function, the function produces side effect to mutate the array to remove the element it used.

var randomWord = function() {
  var words = ['apple', 'banana', 'orange', 'pear'];

  return function () {
    function drawRandomSample(array) {
      return array.splice(Math.floor(Math.random() * array.length), 1);
    }

    return drawRandomSample(words)[0];
  }
}();

// Start a New Game

// We need a Game constructor that we can use to construct a new game. When we plan out the constructor, we need to examine all the states that a game needs to track.

// the word chosen for the current game
// number of incorrect guesses - this controls the number of apples we show
// all the letters guessed - the letters will show for "Guesses"
// total allowed wrong guesses - this should be 6, since we only have 6 apples!
// A game object, after it's constructed, should be able to do the following:

// it needs to choose a word from the words array as the word of the game. If all words are chosen, show the "Sorry, I've run out of words!" message
// number of incorrect guesses should be initialized to 0
// the letters guessed should be initialized as an empty array
// set total allowed wrong guesses to 6
// create blanks in the "Word:" container. The number of blanks should be the same as the length of the chosen word
// There're more than one way to implement the above, and you could try to use both the pseudoclassical pattern or the OLOO pattern when it comes to the game object creation.

function Game() {
  this.incorrect = 0;
  this.lettersGuessed = [];
  this.correctSpaces = 0;
  this.word = randomWord();

  if(!this.word) {
    this.displayMessage("Sorry, I've run out of words!");
  }

  this.word = this.word.split("");
  this.init();
}

Game.prototype = {
  maxIncorrect: 6,
  createBlanks: function() {
    var spaces = (new Array(this.word.length + 1)).join("<span></span>");

    $letters.find("span").remove();
    $letters.append(spaces);
    this.$spaces = $("#spaces span");
  },
  displayMessage: function(text) {
    $message.text(text);
  },
  removeMessage: function() {
    this.displayMessage("");
  },
  startNewGame: function(e) {
    e.preventDefault();
    $("#message a").remove();
    $apples.removeClass();
    new Game();
  },
  displayNewGame: function() {
    $message.append('<a href="#">Play again</a>');
    $("#message a").on("click", this.startNewGame.bind(this));
  },
  duplicateGuess(letter) {
    return this.lettersGuessed.indexOf(letter) >= 0;
  },
  addToGuessedLetters: function(letter) {
    this.lettersGuessed.push(letter);
    $("<span />", {
      text: letter
    }).appendTo($guesses);

    // my initial working attempt prior to solution:
    // $guesses.append("<span></span>").find("span").last().text(letter);
  },
  doesWordInclude(letter) {
    return this.word.indexOf(letter) >= 0;
  },
  updateBlanks(letter) {
    for (var i = 0; i < this.word.length; i++) {
      if (letter === this.word[i]) {
        this.$spaces.eq(i).text(letter);
        this.correctSpaces++;
      }
    }
  },
  incrementIncorrect() {
    this.incorrect++;
    $("#apples").removeClass().addClass("guess_" + this.incorrect);
  },
  processLetter: function(letter) {
    if (this.duplicateGuess(letter)) {
    } else {
      this.addToGuessedLetters(letter);
      if (this.doesWordInclude(letter)) {
        this.updateBlanks(letter); 
      } else {
        this.incrementIncorrect();
      }
    }
  },
  checkWin: function() {
    return this.word.length === this.correctSpaces;
  },
  checkLose: function() {
    return this.incorrect >= this.maxIncorrect;
  },
  changeBackground: function(state) {
    $("body").removeClass().addClass(state);
  },
  processGuess: function(e) {
    var char = e.which;
    var letter = String.fromCharCode(char);

    if (notALetter(letter)) { return; }
    
    this.processLetter(letter);

    if (this.checkWin()) {
      this.unbind();
      this.displayMessage("You win!");
      this.displayNewGame();
      this.changeBackground("win");
    } else if (this.checkLose()) {
      this.unbind();
      this.displayMessage("You lose!");
      this.displayNewGame();
      this.changeBackground("lose");
    }
  },
  emptyGuesses: function() {
    $guesses.find("span").remove();
  },
  unbind: function() {
    $(document).off(".game");
  },
  bind: function() {
    $(document).on("keypress.game", this.processGuess.bind(this));
  },
  init: function() {
    this.unbind();
    this.bind();
    this.changeBackground("");
    this.emptyGuesses();
    this.createBlanks();
    this.removeMessage();

  }
};

function notALetter(letter) {
  var char = letter.charCodeAt(0);
  var aCode = 97;
  var zCode = 122;

  return char < aCode || char > zCode; 
}

new Game();
