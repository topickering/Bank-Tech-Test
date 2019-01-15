require 'account'
require 'transaction'
require 'transaction_formatter'
require 'statement'
require 'timecop'

describe Account do

  let(:account) { Account.new }
  let(:deposit) { double("Transaction", amount: 10, time: time) }
  let(:deposit) { double("Transaction", amount: 10, time: time) }

  before do
    Timecop.freeze(Time.local(2019, 1, 18))
  end

  describe '#print_statement' do
    it 'prints an empty statement if there have been no deposits or withdrawals' do
      expect { account.print_statement }.to output("\"date || credit || debit || balance\"\n").to_stdout
    end
    it 'prints a statement with any deposits or withdrawals in reverse chronological order' do
      account.deposit(150)
      account.withdraw(100)
      expect { account.print_statement }.to output("\"date || credit || debit || balance\"\n\"18/1/2019 ||  ||  100.00|| 50.00\"\n\"18/1/2019 || 150.00 || || 150.00\"\n").to_stdout
    end
  end

  describe '#deposit' do
    it 'increases the balance by an amount' do
      account.deposit(150)
      expect(account.balance).to eq(150)
    end
  end

  describe '#withdrawal' do
    it 'increases the balance by an amount' do
      account.deposit(150)
      account.withdraw(100)
      expect(account.balance).to eq(50)
    end
  end

end
