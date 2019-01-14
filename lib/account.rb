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

  def withdraw(amount)
    fail "Cannot withdraw more than available balance" if exceeds_balance?(amount)

    deposit(-amount)
  end

  def print_statement
    running_balance = @balance
    p 'date || credit || debit || balance'
    @transactions.each do |t|
      p t.transaction_print + "|| #{running_balance}"
      running_balance -= t.amount
    end
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
