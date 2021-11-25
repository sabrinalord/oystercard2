# frozen_string_literal: true

require 'journey_log'

describe JourneyLog do
    let(:exit_station) { double :station }
    let(:entry_station) { double :station }
    let(:journey) { { entry_station: entry_station, exit_station: exit_station } }

  it 'stores the journey' do
    subject.add_journey(entry_station, exit_station)
    expect(subject.journey_list).to include journey
  end

  describe ' #start' do
    it 'starts a journey' do
      expect(journey).to receive().with(entry_station: entry_station)
      subject.start(entry_station)
    end
  end


end
