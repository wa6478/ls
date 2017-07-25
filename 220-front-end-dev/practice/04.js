function makeBank() {
  var accounts = [];

  function makeAccount(number) {
    var balance = 0;
    var transactions = [];

    return {
      number: function() { return number; },
      balance: function() { return balance; },
      transactions: function () { return transactions; },
      deposit: function(amount) {
        balance += amount;
        transactions.push({type: "deposit", amount: amount});
        return amount;
      },
      withdraw: function(amount) {
        if (amount > balance) {
          amount = balance;
        }
        balance -= amount;
        transactions.push({type: "withdraw", amount: amount});
        return amount;
      },
    };
  }

  return {
    // accounts: function() { return accounts; },
    openAccount: function() {
      var number = accounts.length + 101;
      var account = makeAccount(number);
      accounts.push(account);
      return account;
    },
    transfer: function(source, destination, amount) {
      if (amount > source.balance) {
        amount = source.balance;
      }

      source.withdraw(amount);
      destination.deposit(amount);
      return amount;
    }
  };
}

var bank = makeBank();
var account = bank.openAccount();
var source = bank.openAccount();
source.deposit(10);
var destination = bank.openAccount();
bank.transfer(source, destination, 7);
console.log(source.balance() === 3);
console.log(destination.balance() === 7);




