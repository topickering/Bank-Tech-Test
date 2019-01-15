require_relative 'transaction'

class TransactionFormatter

  attr_reader :transaction

  def initialize(transaction)
    @transaction = transaction
  end

  def transaction_print
    "#{time_formatter}" + "#{amount_formatter}"
  end

  def time_formatter
    time = @transaction.time
    "#{time.day}/#{time.month}/#{time.year} ||"
  end

  def amount_formatter
    amount = @transaction.amount
    if amount < 0
      "  ||  #{-amount}"
    else
      " #{amount} || "
    end
  end

end
