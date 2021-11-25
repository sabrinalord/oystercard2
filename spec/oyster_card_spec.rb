# frozen_string_literal: true

require 'oyster_card'

describe OysterCard do
  let(:exit_station) { double :station }
  let(:entry_station) { double :station }

  let(:journey) { { entry_station: entry_station, exit_station: exit_station } }

  # it 'has an empty list of journeys by default' do
  #   expect(subject.journey_list).to be_empty
  # end

  it 'checks if there is money on the balance' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it 'can top up the balance' do
      expect { subject.top_up(OysterCard::MINIMUM_FARE) }.to change { subject.balance }.by OysterCard::MINIMUM_FARE
    end

    it 'raise error if balance exceeds max capacity' do
      subject.top_up(OysterCard::MAX_BALANCE)
      expect { subject.top_up(1) }.to raise_error(OysterCard::ERROR[:max])
    end
  end

  describe '#touch_in' do
    it 'checks if oyster card has less than the minimum fare (£1)' do
      expect { subject.touch_in('warwick') }.to raise_error(OysterCard::ERROR[:min])
    end

    describe 'top up card before tests' do
      before(:each) do
        subject.top_up(OysterCard::MINIMUM_FARE)
      end

      it 'checks if oyster card has touched in' do
        subject.touch_in('warwick')
        expect(subject.in_journey).to eq true
      end
    end
  end

  it 'deducts money from the Oyster Card' do
    current_balance = subject.top_up(OysterCard::MAX_BALANCE)
    subject.deduct(OysterCard::MINIMUM_FARE)
    expect(subject.deduct).to be < current_balance
  end

  describe '#touch_out' do
    let(:exit_station) { double :station }
    let(:entry_station) { double :station }

    # it 'stores an exit station' do
    #   subject.top_up(OysterCard::MINIMUM_FARE)
    #   subject.touch_in(entry_station)
    #   subject.touch_out(exit_station)
    #   expect(subject.exit_station).to eq exit_station
    # end

    it 'expects an exit station argument' do
      expect(subject).to respond_to(:touch_out).with(1).argument
    end

    it 'checks if oyster card has touched out' do
      current_balance = subject.balance
      subject.touch_out('coventry')
      expect(subject.balance).to be < current_balance
    end

    it 'checks if oyster reduces balance by correct amount' do
      expect { subject.touch_out('coventry') }.to change { subject.balance }.by(-OysterCard::MINIMUM_FARE)
    end
  end

  # it 'stores the entry station on the card' do
  # subject.touch_in(:entry_station)
  # expect(subject.entry_station) to be
  # end
end
