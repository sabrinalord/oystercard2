# frozen_string_literal: true

# Oystercard class below
class OysterCard
  attr_reader :balance

  def initialize
    @balance = 1
  end

  def limit?
    raise 'You already have £90!' if @balance >= 90
  end

  def top_up(amount)
    if @balance + amount > 90
      is_limit?
    else
      @balance += amount
    end
  end
end
