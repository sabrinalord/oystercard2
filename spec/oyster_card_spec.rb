# frozen_string_literal: true

require 'oyster_card'

describe OysterCard do
  it 'checks if there is money on the balance' do
    expect(subject.balance).to be > 0
  end

  it 'adds money to the Oyster Card' do
    current_balance = subject.balance
    subject.top_up(1)
    expect(subject.balance).to be > current_balance
  end

  it 'checks if balance is at max capacity (above £90)' do
    subject.is_limit?
    expect { raise is_limit? }.to raise_error 'You already have £90!'
  end
end
