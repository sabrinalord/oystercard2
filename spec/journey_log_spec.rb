# frozen_string_literal: true
require 'journey'
require 'journey_log'

    # It should be responsible for starting a journey, ending a journey and returning a list of journeys.

describe JourneyLog do
    let(:exit_station) { double :station }
    let(:entry_station) { double :station }
    let(:journey) { { entry_station: entry_station, exit_station: exit_station } }

  describe ' #start' do
    it 'starts a journey' do
      expect(journey).to receive().with(entry_station: entry_station)
      subject.start(entry_station)
    end
  end


end
