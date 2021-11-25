# frozen_string_literal: true

class Journey
  attr_reader :entry_station, :exit_station

  PENALTY_FARE = 1
  def initialize(entry_station)
    @entry_station = entry_station
  end

  def complete?
    exit_station ? true : false
  end

  def fare
    PENALTY_FARE
  end

  def finish(exit_station)
    @exit_station = exit_station
    self
  end

  #  def in_journey?
  #      @in_journey
  #   end

  # def add_journey(entry_station, exit_station)
  #     @journey_list << {entry_station: entry_station, exit_station: exit_station}
  # end
end
