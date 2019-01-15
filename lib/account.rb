require_relative 'transaction'
require_relative 'statement'

class Account

  attr_reader :balance, :transactions

  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE, statement = Statement,
    transaction = Transaction)
    @balance = balance
    @transactions = []
    @statement = statement
    @transaction = transaction
  end

  def deposit(amount)
    transaction(amount)
    update_balance(amount)
  end

  def withdraw(amount)
    fail "Insufficient funds" if exceeds_balance?(amount)

    deposit(-amount)
  end

  def print_statement
    statement = @statement.new(self)
    statement.print
  end

private

  def transaction(amount)
    @transactions.unshift(@transaction.new(amount))
  end

  def update_balance(amount)
    @balance += amount
  end

  def exceeds_balance?(amount)
    amount > @balance
  end

end
