require_relative 'transaction'

class Account

  attr_reader :balance, :transactions

  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    transaction(amount)
    update_balance(amount)
  end

private

  def transaction(amount)
    @transactions.push(Transaction.new(amount))
  end

  def update_balance(amount)
    @balance += amount
  end

end
