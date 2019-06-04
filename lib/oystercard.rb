class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @active = false
  end

  def top_up(amount)
    fail 'Max balance of #{MAXIMUM_BALANCE} exceeded' if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail "You don't have enough money" if balance < MINIMUM_FARE
    @active = true
  end

  def touch_out
    @active = false
  end

  def in_journey?
    @active
  end

end
