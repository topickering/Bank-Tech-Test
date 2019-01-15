require 'transaction_formatter'

describe TransactionFormatter do

  time = Time.new(2019, 1, 18)
  let(:deposit) { double("Transaction", amount: 10, time: time) }
  let(:withdrawal) { double("Transaction", amount: -10, time: time) }
  let(:deposit_formatter) { TransactionFormatter.new(deposit) }
  let(:withdrawal_formatter) { TransactionFormatter.new(withdrawal) }

  describe '#transaction_print' do
    it 'returns a string with formatted transaction info (deposit test)' do
      expect(deposit_formatter.transaction_print).to eq "18/1/2019 || 10.00 || "
    end
    it 'returns a string with formatted transaction info (withdrawal test)' do
      expect(withdrawal_formatter.transaction_print).to eq "18/1/2019 ||  ||  10.00"
    end
  end

end
