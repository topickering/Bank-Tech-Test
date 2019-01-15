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
      first_deposit
      second_deposit
      test_withdrawal
      expect { account.print_statement }.to output("\"date || credit || debit || balance\"\n\"14/1/2012 ||  ||  500.00|| 2500.00\"\n\"13/1/2012 || 2000.00 || || 3000.00\"\n\"10/1/2012 || 1000.00 || || 1000.00\"\n").to_stdout
    end
  end

  def first_deposit
    Timecop.freeze(Time.local(2012, 01, 10))
    account.deposit(1000)
  end

  def second_deposit
    Timecop.freeze(Time.local(2012, 01, 13))
    account.deposit(2000)
  end

  def test_withdrawal
    Timecop.freeze(Time.local(2012, 01, 14))
    account.withdraw(500)
  end

end
