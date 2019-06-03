require 'oystercard'

describe Oystercard do

  it "has a balance" do
    oystercard = Oystercard.new
    expect(subject.balance).to eq(0)
  end

  it "can top up the balance" do
    oystercard = Oystercard.new
    expect(subject.top_up).to eq(5)
  end



end
