require 'account'

describe Account do

  time = Time.new(2019, 1, 18)
  let(:transaction) { double("Transaction") }
  let(:test_deposit) { double("Transaction", amount: 10, time: time) }
  let(:test_withdrawal) { double("Transaction", amount: 10, time: time) }
  let(:statement) { double("Statement") }
  let(:subject) { Account.new(statement, transaction) }

  it 'opens with a balance of zero' do
    expect(subject.balance).to eq 0
  end

  it 'initializes with an array for transactions' do
    expect(subject.transactions.is_a? Array).to be true
  end

  describe '#deposit' do
    it 'adds a transaction to the transactions array' do
      allow(transaction).to receive(:new) { test_deposit }
      subject.deposit(10)
      expect(subject.transactions.length).to eq 1
    end
    it 'increases the balance by an amount' do
      allow(transaction).to receive(:new) { test_deposit }
      expect { subject.deposit(10) }.to change { subject.balance }.by 10
    end
  end

  describe '#withdraw' do
    it 'adds a transaction to the transactions array' do
      allow(transaction).to receive(:new) { test_deposit }
      subject.deposit(10)
      allow(transaction).to receive(:new) { test_withdrawal }
      subject.withdraw(10)
      expect(subject.transactions.length).to eq 2
    end
    it 'reduces the balance by an amount' do
      allow(transaction).to receive(:new) { test_deposit }
      subject.deposit(10)
      allow(transaction).to receive(:new) { test_withdrawal }
      expect { subject.withdraw(10) }.to change { subject.balance }.by(-10)
    end
    it 'throws an error if the withdrawal amount exceeds the balance' do
      expect { subject.withdraw(1) }.to raise_error "Insufficient funds"
    end
  end

  describe '#print_statement' do
    it 'is a method to which account will respond' do
      allow(statement).to receive(:print) {'Test Statement'}
      expect(subject).to respond_to(:print_statement)
    end
  end

end
