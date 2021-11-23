# frozen_string_literal: true

# Oystercard class below
class OysterCard
  attr_reader :balance, :max

  def initialize(max = 90)
    @balance = 8
    @max = max
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
    raise 'Not enough money here!' unless @balance > fare

    @balance -= fare
  end
end
