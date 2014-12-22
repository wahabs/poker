require 'deck'

describe Deck do

  subject { Deck.new }
  let(:other_deck) { Deck.new }

  it "should initialize with 52 cards" do
    expect(subject.cards.length).to eq(52)
  end

  it "should allow cards to be drawn from the top" do
    expect(subject.draw(1)).to eq([other_deck.cards[0]])
    expect(subject.draw(3)).to eq(other_deck.cards[1..3])
    expect(subject.cards.length).to eq(48)
  end

  it "should return cards to the bottom of the deck" do
    retaking = subject.draw(5)
    subject.retake(retaking)
    expect(subject.cards[-5..-1]).to eq(other_deck.cards[0...5])
  end

end
