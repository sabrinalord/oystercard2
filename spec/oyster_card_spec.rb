# frozen_string_literal: true

require 'oyster_card'

describe OysterCard do
  it 'checks if there is money on the balance' do
    expect(subject.balance).to be > 0
  end

  it 'adds money to the Oyster Card' do
    current_balance = subject.balance
    subject.top_up(OysterCard::FARE)
    expect(subject.top_up).to be > current_balance
  end

  it 'raise error if balance exceeds max capacity' do
    expect { subject.top_up(OysterCard::MAX_BALANCE) }.to raise_error "You already have £#{OysterCard::MAX_BALANCE}!"
  end

  it 'deducts money from the Oyster Card' do
    current_balance = subject.balance
    subject.deduct(OysterCard::FARE)
    expect(subject.deduct).to be < current_balance
  end

  it 'checks if oyster card has touched in' do
    subject.touch_in
    expect(subject.touch_in).to eq true
  end

  it 'checks if oyster card is in use' do
    expect(subject.in_journey?).to be(false)
  end

  it 'checks if oyster card has touched out' do
    current_balance = subject.balance
    subject.touch_out
    expect(subject.balance).to be < current_balance
  end

  it 'checks if oyster card has minimum of 1 pound' do
    subject.touch_in
    expect(subject.balance).to be >= OysterCard::MINIMUM_FARE
  end

  it 'checks if oyster card has less than the minimum fare (£1)' do
    subject.deduct(balance)
    expect(subject.touch_in).to raise_error 'insufficient funds'
  end

  it 'checks if oyster reduces balance by correct amount' do
    expect { subject.touch_out }.to change { subject.balance }.by(OysterCard::MINIMUM_FARE)
  end

  # it 'stores the entry station on the card' do
  # subject.touch_in(:entry_station)
  # expect(subject.entry_station) to be
  # end
end
