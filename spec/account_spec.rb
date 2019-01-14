require 'account'

describe Account do

  it 'opens with a balance of zero' do
    expect(subject.balance).to eq 0
  end

  it 'initializes with an array for transactions' do
    expect(subject.transactions.is_a? Array).to be true
  end

  describe '#deposit' do
    it 'adds a transaction to the transactions array' do
      subject.deposit(10)
      expect(subject.transactions[0]).to be_a Transaction
    end
    it 'increases the balance by an amount' do
      expect { subject.deposit(10) }.to change { subject.balance }.by 10
    end
  end

  describe '#withdraw' do
    it 'adds a transaction to the transactions array' do
      subject.deposit(10)
      subject.withdraw(10)
      expect(subject.transactions[0]).to be_a Transaction
    end
    it 'reduces the balance by an amount' do
      subject.deposit(10)
      expect { subject.withdraw(10) }.to change { subject.balance }.by -10
    end
    it 'throws an error if the withdrawal amount exceeds the balance' do
      expect { subject.withdraw(1) }.to raise_error "Cannot withdraw more than available balance"
    end
  end

  describe '#print_statement' do
    it 'prints a statement showing the transactions' do
      expect { subject.print_statement }.to output("\"date || credit || debit || balance\"\n").to_stdout
    end
  end

end
