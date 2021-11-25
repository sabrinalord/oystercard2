# frozen_string_literal: true

# Oystercard class below
class OysterCard
  MINIMUM_FARE = 1
  MAX_BALANCE = 90
  ERROR = {
    max: 'Maximum allowance reached'.freeze,
    min: 'insufficient funds'
   }
  attr_reader :balance, :in_journey, :entry_station, :exit_station, :journey_list

  def initialize
    @balance = 0
    @in_journey = false
    @journey_list = []
  end

  def top_up(amount = 0)
    raise ERROR[:max] if @balance + amount > MAX_BALANCE

    @balance += amount
  end

  def deduct(fare = 0)
    @balance -= MINIMUM_FARE
  end

  def touch_in(entry_station)
    raise 'insufficient funds' if @balance < MINIMUM_FARE

    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @in_journey = false

    deduct

    add_journey(entry_station, exit_station)

    @exit_station = exit_station
    @entry_station = nil
  end

  def add_journey(entry_station, exit_station)
    @journey_list << {entry_station: entry_station, exit_station: exit_station} 
  end
end
