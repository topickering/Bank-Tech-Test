class Transaction

  attr_reader :amount, :time

  def initialize(amount)
    @amount = amount
    @time = Time.new
  end

end
