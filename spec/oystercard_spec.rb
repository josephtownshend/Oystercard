require 'oystercard'

describe Oystercard do

  it "has a balance" do
    oystercard = Oystercard.new
    expect(subject.balance).to eq(0)
  end

  it 'raises an error if the max balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1}.to raise_error 'Max balance of #{MAXIMUM_BALANCE} exceeded'
  end

  describe '#top_up' do
     it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end

  #describe 'deduct' do
  #  it 'can deduct money from the card' do
  #  expect{ subject.deduct 5 }.to change{ subject.balance }.by -5
  #  end
  #end

  describe 'in_journey' do
    it 'oystecard active if touch_in' do
      subject.top_up(5)
      expect(subject.touch_in).to eq true
    end

    it 'oystercard in-active if touch_out' do
      expect(subject.touch_out).to eq false
    end

    it 'oystercard balance reduces by min fare' do
      minimum_fare = Oystercard::MINIMUM_FARE
      subject.top_up(5)
      subject.touch_in
      expect{ subject.touch_out }.to change{ subject.balance }.by -minimum_fare
    end

    it 'oystercard active, in-journey' do
      subject.top_up(5)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'oystercard in-active, not-in-journey' do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'raises an error if the min balance < minimum_fare' do
      expect{ subject.touch_in }.to raise_error "You don't have enough money"
    end

  end
end
