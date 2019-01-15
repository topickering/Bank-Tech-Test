class Transaction

  attr_reader :amount, :time

  def initialize(amount, time = Time.new)
    @amount = amount
    @time = time
  end

end
