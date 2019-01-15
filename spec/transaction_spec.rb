require 'transaction'

describe Transaction do

  let(:time) { Time.new(2019, 1, 18) }
  let(:deposit) { Transaction.new(10, time) }

  it 'records an amount' do
    expect(deposit.amount).to eq 10
  end

  it 'records the time of the transaction' do
    expect(deposit).to respond_to(:time)
  end

end
