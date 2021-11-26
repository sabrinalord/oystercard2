# frozen_string_literal: true
require 'journey_log'

    # It should be responsible for starting a journey, ending a journey and returning a list of journeys.

describe JourneyLog do
  let(:journey_log) {described_class.new}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  describe ' #start' do
    it 'starts a journey' do
      expect(journey_log).to respond_to(:start)
    end

    it 'records a journey' do
      journey_log.start(entry_station)
      expect(journey_log.journey_list).to include(journey_log.journey)
    end
  end

  describe ' #finish' do
    it 'finishes a journey' do
      expect(journey_log).to respond_to(:finish)
    end

    it 'resets current journey' do
      journey_log.start(entry_station)
      journey_log.finish(exit_station)
      expect(journey_log.journey).to be(nil)
    end
  end

end

