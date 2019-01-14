require 'account'

describe Account do

  it 'opens with a balance of zero' do
    expect(subject.balance).to eq 0
  end

  it 'initializes with an array for transactions' do
    expect(subject.transactions.is_a? Array).to be true
  end

  describe '#transaction' do
    it 'adds a transaction to the transactions array' do
      subject.transaction(10)
      expect(subject.transactions.length).to eq 1
    end
  end

  describe '#update_balance' do
    it 'changes the balance by an amount' do
      subject.update_balance(10)
      expect(subject.balance).to eq 10
    end
  end

  describe '#deposit' do
    it 'adds a transaction to the transactions array' do
      subject.deposit(10)
      expect(subject.transactions.length).to eq 1
    end
    it 'increases the balance by an amount' do
      subject.deposit(10)
      expect(subject.balance).to eq 10
    end
  end

end
