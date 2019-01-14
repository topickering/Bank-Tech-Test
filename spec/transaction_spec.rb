require 'transaction'

describe Transaction do

let(:time) { Time.new(2019, 1, 18) }
let(:deposit) { Transaction.new(10, time) }
let(:withdrawal) { Transaction.new(-10, time) }

  it 'records an amount' do
    expect(deposit.amount).to eq 10
  end

  it 'records the time of the transaction' do
    expect(deposit).to respond_to(:time)
  end

  describe '#time_formatter' do
    it 'formats @time into a standard date format' do
      expect(deposit.time_formatter).to eq "18/1/2019 ||"
    end
  end

  describe '#amount_formatter' do
    it 'formats a positive @amount into a standard format' do
      expect(deposit.amount_formatter).to eq " 10 || "
    end
    it 'formats a negataive @amount into a standard format' do
      expect(withdrawal.amount_formatter).to eq "  ||  10"
    end
  end

  describe '#transaction_print' do
    it 'returns a string with formatted transaction info' do
      expect(deposit.transaction_print).to eq "18/1/2019 || 10 || "
    end
  end

end
