require_relative 'transaction'
require_relative 'statement'

class Account

  attr_reader :balance, :transactions, :statement

  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE, statement = Statement)
    @balance = balance
    @transactions = []
    @statement = statement
  end

  def deposit(amount)
    transaction(amount)
    update_balance(amount)
  end

  def withdraw(amount)
    fail "Cannot withdraw more than available balance" if exceeds_balance?(amount)

    deposit(-amount)
  end

  def print_statement
    statement = @statement.new(self)
    statement.print
  end

private

  def transaction(amount)
    @transactions.unshift(Transaction.new(amount))
  end

  def update_balance(amount)
    @balance += amount
  end

  def exceeds_balance?(amount)
    amount > @balance
  end

end
