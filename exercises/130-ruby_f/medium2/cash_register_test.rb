require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(5)
    @transaction.amount_paid = 10
  end

  def test_accept_money
    assert_equal(@register.total_money + 10, @register.accept_money(@transaction))
  end

  def test_change
    change = @transaction.amount_paid - @transaction.item_cost
    assert_equal(change, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $5.\n") do # testing an output is a way to test a side effect
      @register.give_receipt(@transaction)
    end
  end

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end
end