class Transaction

  attr_reader :amount, :time

  def initialize(amount, time = Time.new)
    @amount = amount
    @time = time
  end

  def transaction_print
    "#{time_formatter}" + "#{amount_formatter}"
  end

  def time_formatter
    "#{@time.day}/#{@time.month}/#{@time.year} ||"
  end

  def amount_formatter
    if @amount < 0
      "  ||  #{-@amount}"
    else
      " #{@amount} || "
    end
  end

end
