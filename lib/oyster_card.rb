# frozen_string_literal: true

# Oystercard class below
class OysterCard
  attr_reader :balance

  def initialize
    @balance = 1
  end

<<<<<<< HEAD
  def is_limit?
    raise "You already have £90!" if @balance >= 90
=======
  def limit?
    raise 'You already have £90!' if @balance >= 90
>>>>>>> 2571a50421676980f7de86a8c3baf93b3a1ba125
  end

  def top_up(amount)
    if @balance + amount > 90
      is_limit?
    else
      @balance += amount
    end
<<<<<<< HEAD
end
=======
  end
>>>>>>> 2571a50421676980f7de86a8c3baf93b3a1ba125
end
