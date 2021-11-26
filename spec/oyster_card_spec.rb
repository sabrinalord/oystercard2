# frozen_string_literal: true

require 'oyster_card'

describe OysterCard do
  let(:exit_station) { double :station }
  let(:entry_station) { double :station }






  
  it 'checks if there is money on the balance' do
    expect(subject.balance).to eq(0)
  end

  it 'deducts money from the Oyster Card' do
    current_balance = subject.top_up(OysterCard::MAX_BALANCE)
    subject.deduct(OysterCard::MINIMUM_FARE)
    expect(subject.deduct).to be < current_balance
  end

  describe '#top_up' do
    it 'can top up the balance' do
      expect { subject.top_up(OysterCard::MINIMUM_FARE) }.to change { subject.balance }.by OysterCard::MINIMUM_FARE
    end

    it 'raise error if balance exceeds max capacity' do
      subject.top_up(OysterCard::MAX_BALANCE)
      expect { subject.top_up(1) }.to raise_error "Maximum allowance reached"
    end
  end

  describe '#touch_in' do
    context 'there are sufficient funds on the card' do
      before(:each) do
        subject.top_up(OysterCard::MINIMUM_FARE)
      end
  
      it 'checks if oyster card has touched in' do
        subject.touch_in(entry_station)
        expect(subject.in_journey).to eq true
      end
    end

    context 'there are insufficient funds on the card' do
      it 'raises error when user tries to touch in' do
        expect { subject.touch_in(entry_station) }.to raise_error "insufficient funds"
      end
    end
  end

  describe '#touch_out' do

    it 'expects an exit station as an argument' do
      expect(subject).to respond_to(:touch_out).with(1).argument
    end

    it 'checks if oyster card has touched out' do
      current_balance = subject.balance
      subject.touch_out(exit_station)
      expect(subject.balance).to be < current_balance
    end

    it 'checks if oyster reduces balance by correct amount' do
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-OysterCard::MINIMUM_FARE)
    end
  end

end
