# frozen_string_literal: true

# Oystercard class below
class OysterCard
  MAX_BALANCE = 90
  attr_reader :balance, :max, :in_journey

  def initialize(max = MAX_BALANCE)
    @balance = 80
    @max = max
    @in_journey = false
  end

  # def limit?
  # raise "You already have £90!" if balance + amount >= @max
  # end

  def top_up(amount = 0)
    raise "You already have £#{MAX_BALANCE}!" if @balance + amount > @max

    @balance += amount
  end

  def deduct(fare = 0)
    @balance -= fare
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
