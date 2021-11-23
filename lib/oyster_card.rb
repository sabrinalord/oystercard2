# frozen_string_literal: true

# Oystercard class below
class OysterCard
  FARE = 1
  MINIMUM_FARE = -1
  MAX_BALANCE = 90
  attr_reader :balance, :max, :in_journey, :entry_station

  def initialize(max = MAX_BALANCE, min = MINIMUM_FARE, _fare = FARE)
    @balance = 10
    @max = max
    @in_journey = false
    @min = min
    @entry_station = []
  end

  def top_up(amount = 0)
    raise "You already have £#{MAX_BALANCE}!" if @balance + amount > @max

    @balance += amount
  end

  def deduct(_fare = 1)
    @balance += MINIMUM_FARE
  end

  def touch_in
    raise 'insufficient funds' if @balance < MINIMUM_FARE

    @in_journey = true
    # entry_station = station
  end

  def touch_out
    @in_journey = false

    deduct
    # @entry_station.delete
  end

  def in_journey?
    @in_journey
  end
end
