require 'transaction'

describe Transaction do

  it 'records an amount' do
    test = Transaction.new(10)
    expect(test.amount).to eq 10
  end

  it 'records the time of the transaction' do
    test = Transaction.new(10)
    expect(test).to respond_to(:time)
  end

end
