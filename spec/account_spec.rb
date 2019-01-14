require 'account'

describe Account do

  it 'opens with a balance of zero' do
    expect(subject.balance).to eq 0
  end

end
