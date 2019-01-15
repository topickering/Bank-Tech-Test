require 'statement'

describe Statement do

  time = Time.new(2019, 1, 18)
  let(:deposit) { double("Transaction", amount: 10, time: time) }
  let(:account) { double("Account", balance: 10, transactions: [deposit]) }
  let(:subject) { Statement.new(account) }

  it 'opens with a default header' do
    expect(subject.header).to eq Statement::HEADER
  end

  describe '#print' do
    it 'prints a statement showing the transactions' do
      expect { subject.print }.to output("\"date || credit || debit || balance\"\n\"18/1/2019 || 10.00 || || 10.00\"\n").to_stdout
    end
  end

end
