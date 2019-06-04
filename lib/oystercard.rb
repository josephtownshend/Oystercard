class Oystercard

  attr_reader :balance

  BALANCE_LIMIT = 90

  def initialize
    @balance = 0
    @active = false
  end

  def top_up(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @active = true
  end

  def touch_out
    @active = false
  end

  def in_journey?
    @active
  end

end
