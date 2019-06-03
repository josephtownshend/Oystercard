require 'oystercard'

describe Oystercard do

  it "has a balance" do
    oystercard = Oystercard.new
    expect(subject.balance).to eq(0)
  end

  #it "can top up the balance" do
  #  oystercard = Oystercard.new
  #  expect(subject.top_up).to eq(nil)
  #end

  describe '#top_up' do

     it { is_expected.to respond_to(:top_up).with(1).argument }

     it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
   end


end
