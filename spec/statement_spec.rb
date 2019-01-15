require 'statement'

describe Statement do

  time = Time.new(2019, 1, 18)
  let(:deposit) { double("Transaction", amount: 10, time: time) }
  let(:account) { double("Account", balance: 10, transactions: [deposit]) }
  let(:formatter) { double("TransactionFormatter") }
  let(:subject) { Statement.new(account) }

  describe '#print' do
    it 'prints a statement showing the transactions' do
      allow(formatter).to receive(:new) { formatter }
      allow(formatter).to receive(:transaction_print) { '18/1/2019 || 10.00 || || 10.00' }
      expect { subject.print }.to output("\"date || credit || debit || balance\"\n\"18/1/2019 || 10.00 || || 10.00\"\n").to_stdout
    end
  end

end
