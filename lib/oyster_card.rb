# frozen_string_literal: true

# Oystercard class below
class OysterCard
  MAX_BALANCE = 90
  attr_reader :balance, :max

  def initialize(max = 90)
    @balance = 80
    @max = max
  end

  # def limit?
  # raise "You already have £90!" if balance + amount >= @max
  # end

  def top_up(amount = 0)
    raise 'You already have £90!' if @balance + amount > @max

    @balance += amount
  end

  def deduct(fare = 0)
    @balance -= fare
  end
end
