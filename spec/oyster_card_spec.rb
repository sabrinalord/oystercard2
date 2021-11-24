# frozen_string_literal: true

require 'oyster_card'

describe OysterCard do

  let(:station){ double :station }

  it 'checks if there is money on the balance' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do

  #  it 'recieves 1 argument' do
   #   { subject.to respond_to(:top_up).with(1).argument }
   # end

    it 'can top up the balance' do
      expect{ subject.top_up(OysterCard::FARE)}.to change{ subject.balance }.by OysterCard::FARE
    end

    it 'raise error if balance exceeds max capacity' do
      subject.top_up(OysterCard::MAX_BALANCE)
      expect { subject.top_up(1) }.to raise_error(OysterCard::ERROR[:max])
    end
  end
  
  describe '#touch_in' do

    it 'checks if oyster card has less than the minimum fare (£1)' do
      expect { subject.touch_in }.to raise_error(OysterCard::ERROR[:min])
    end

    describe 'top up card before tests' do
      before(:each) do
          subject.top_up(OysterCard::FARE)
      end

    it 'checks if oyster card has touched in' do
      expect(subject.touch_in).to eq true
    end

  end


  end
  it 'deducts money from the Oyster Card' do
    current_balance = subject.top_up(OysterCard::MAX_BALANCE)
    subject.deduct(OysterCard::FARE)
    expect(subject.deduct).to be < current_balance
  end



  it 'checks if oyster card is in use' do
    expect(subject.in_journey?).to be(false)
  end

  it 'checks if oyster card has touched out' do
    current_balance = subject.balance
    subject.touch_out
    expect(subject.balance).to be < current_balance
  end

  it 'checks if oyster reduces balance by correct amount' do
    expect { subject.touch_out }.to change { subject.balance }.by(OysterCard::MINIMUM_FARE)
  end
 
  # it 'stores the entry station on the card' do
  # subject.touch_in(:entry_station)
  # expect(subject.entry_station) to be
  # end
end
