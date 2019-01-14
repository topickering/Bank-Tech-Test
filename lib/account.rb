require_relative 'transaction'

class Account

  attr_reader :balance, :transactions

  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @transactions = []
  end

end
