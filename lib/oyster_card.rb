# frozen_string_literal: true

# Oystercard class below
class OysterCard
  attr_reader :balance, :max

  def initialize
    @balance = 8
    @max = 90
  end

  def limit?
    raise "You already have £#{@max}!" if @balance >= @max
  end

  def top_up(amount = 1)
    if @balance + amount > @max
      limit?
    else
      @balance += amount
    end
  end

  def deduct(fare = 1)
    if @balance > fare
      @balance -= fare
    else
      raise "Not enough here!"
    end
  end
end
