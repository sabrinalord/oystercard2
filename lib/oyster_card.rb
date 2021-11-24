# frozen_string_literal: true

# Oystercard class below
class OysterCard
  FARE = 1
  MINIMUM_FARE = -1
  MAX_BALANCE = 90
  ERROR = {
    max: 'Maximum allowance reached'.freeze,
    min: 'insufficient funds'
   }
  attr_reader :balance, :in_journey, :entry_station

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up(amount = 0)
    raise ERROR[:max] if @balance + amount > MAX_BALANCE

    @balance += amount
  end

  def deduct(fare = 0)
    @balance += MINIMUM_FARE
  end

  def touch_in
    raise 'insufficient funds' if @balance < FARE

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
