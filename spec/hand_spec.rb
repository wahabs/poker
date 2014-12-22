require 'hand'

describe Hand do

  let (:sf_hand) do
    Hand.new([
      Card.new(:clubs, :jack),
      Card.new(:clubs, :ten),
      Card.new(:clubs, :nine),
      Card.new(:clubs, :eight),
      Card.new(:clubs, :seven)
      ])
  end

  let (:fh_hand) do
    Hand.new([
      Card.new(:spades, :five),
      Card.new(:hearts, :five),
      Card.new(:diamonds, :five),
      Card.new(:spades, :eight),
      Card.new(:hearts, :eight)
      ])
  end

  let (:toak_hand) do
    Hand.new([
      Card.new(:clubs, :three),
      Card.new(:diamonds, :three),
      Card.new(:hearts, :three),
      Card.new(:spades, :queen),
      Card.new(:spades, :deuce)
      ])
  end

  let (:other_toak_hand) do
    Hand.new([
      Card.new(:clubs, :king),
      Card.new(:diamonds, :king),
      Card.new(:hearts, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :deuce)
      ])
  end

  let (:hc_hand) do
    Hand.new([
      Card.new(:hearts, :ace),
      Card.new(:hearts, :king),
      Card.new(:clubs, :queen),
      Card.new(:hearts, :ten),
      Card.new(:clubs, :deuce)
      ])
    end

  it "should assign hand rankings" do
    expect(sf_hand.rank).to eq(:straight_flush)
    expect(fh_hand.rank).to eq(:full_house)
    expect(toak_hand.rank).to eq(:three_of_a_kind)
    expect(hc_hand.rank).to eq(:high_card)
  end

  it "should be able to compare hands" do
    expect(sf_hand.beats?(fh_hand)).to be true
    expect(sf_hand.beats?(toak_hand)).to be true
    expect(toak_hand.beats?(fh_hand)).to be false
    expect(toak_hand.beats?(hc_hand)).to be true
    expect(fh_hand.beats?(hc_hand)).to be true
    expect(other_toak_hand.beats?(toak_hand)).to be true
  end


end
