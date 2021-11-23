# frozen_string_literal: true

require 'oyster_card'

describe OysterCard do
  it 'checks if there is money on the balance' do
    expect(subject.balance).to be > 0
  end

  it 'adds money to the Oyster Card' do
    current_balance = subject.balance
    subject.top_up
    expect(subject.balance).to be > current_balance
  end

  it 'checks if balance is at max capacity' do
    subject.limit?
    expect { raise limit? }.to raise_error
  end

  it 'deducts money from the Oyster Card' do
    current_balance = subject.balance
    subject.deduct
    expect(subject.balance).to be < current_balance
  end

  it 'checks if there is enough money to be deducted' do
    subject.deduct
    expect { raise deduct }.to raise_error
  end
end
