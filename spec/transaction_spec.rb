require 'transaction'

describe Transaction do

  it 'records an amount' do
    test = Transaction.new(10)
    expect(test.amount).to eq 10
  end

end
