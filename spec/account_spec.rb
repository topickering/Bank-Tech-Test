require 'account'

describe Account do

  it 'opens with a balance of zero' do
    expect(subject.balance).to eq 0
  end

  it 'initializes with an array for transactions' do
    expect(subject.transactions.is_a? Array).to be true
  end

end
