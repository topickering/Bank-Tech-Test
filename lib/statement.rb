require_relative 'account'
require_relative 'transaction_formatter'

class Statement

  attr_reader :account, :header

  DEFAULT_HEADER = 'date || credit || debit || balance'

  def initialize(account, header = DEFAULT_HEADER, formatter = TransactionFormatter)
    @account = account
    @header = header
    @formatter = formatter
  end

  def print
    running_balance = @account.balance
    p @header
    @account.transactions.each do |t|
      p @formatter.new(t).transaction_print + "|| #{'%.2f' % running_balance}"
      running_balance -= t.amount
    end
  end

end