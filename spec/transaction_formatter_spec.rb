require 'transaction_formatter'

describe TransactionFormatter do

  time = Time.new(2019, 1, 18)
  let(:deposit) { double("Transaction", amount: 10, time: time) }
  let(:withdrawal) { double("Transaction", amount: -10, time: time) }
  let(:deposit_formatter) { TransactionFormatter.new(deposit) }
  let(:withdrawal_formatter) { TransactionFormatter.new(withdrawal) }

  describe '#time_formatter' do
    it 'formats @time into a standard date format' do
      expect(deposit_formatter.time_formatter).to eq "18/1/2019 ||"
    end
  end

  describe '#amount_formatter' do
    it 'formats a positive @amount into a standard format' do
      expect(deposit_formatter.amount_formatter).to eq " 10.00 || "
    end
    it 'formats a negataive @amount into a standard format' do
      expect(withdrawal_formatter.amount_formatter).to eq "  ||  10.00"
    end
  end

  describe '#transaction_print' do
    it 'returns a string with formatted transaction info' do
      expect(deposit_formatter.transaction_print).to eq "18/1/2019 || 10.00 || "
    end
  end

end
