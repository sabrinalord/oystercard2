require 'oyster_card'

describe OysterCard do
  it 'checks if there is money on the balance' do
    expect(subject.balance).to be > 0
  end
end
