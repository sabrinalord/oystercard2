# frozen_string_literal: true

# Oystercard class below
class OysterCard
  MINIMUM_FARE = 1
  MAX_BALANCE = 90
  attr_reader :balance, :max, :in_journey

  def initialize(max = MAX_BALANCE, min = MINIMUM_FARE)
    @balance = 1
    @max = max
    @in_journey = false
    @min = min
  end

  def top_up(amount = 0)
    raise "You already have £#{MAX_BALANCE}!" if @balance + amount > @max

    @balance += amount
  end

  def deduct(fare = 0)
    @balance -= fare
  end

  def touch_in
    raise 'insufficient funds' if @balance < 1

    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
