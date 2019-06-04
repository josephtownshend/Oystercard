require 'oystercard'

describe Oystercard do

  it "has a balance" do
    oystercard = Oystercard.new
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do

     # it { is_expected.to respond_to(:top_up).with(1).argument }

     it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

  end

  describe 'deduct' do
    it 'can deduct money from the card' do
    expect{ subject.deduct 5 }.to change{ subject.balance }.by -5
    end
  end

  describe 'in_journey' do
    it 'oystecard active if touch_in' do
      expect(subject.touch_in).to eq true
    end

    it 'oystercard in-active if touch_out' do
      expect(subject.touch_out).to eq false
    end

    it 'oystercard active, in-journey' do
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'oystercard in-active, not-in-journey' do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end
