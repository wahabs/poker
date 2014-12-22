require 'deck'

class Hand

  ORDER = {
    :straight_flush => 1,
    :four_of_a_kind => 2,
    :full_house => 3,
    :flush => 4,
    :straight => 5,
    :three_of_a_kind => 6,
    :two_pair => 7,
    :one_pair => 8,
    :high_card => 9
  }

  def self.order
    ORDER
  end

  attr_accessor :cards

  def initialize(cards)
    raise Exception.new "can't initialize with more than five cards" if cards.length > 5
    @cards = cards
  end

  def rank
    return :straight_flush if straight_flush?
    return :four_of_a_kind if four_of_a_kind?
    return :full_house if full_house?
    return :flush if flush?
    return :straight if straight?
    return :three_of_a_kind if three_of_a_kind?
    return :two_pair if two_pair?
    return :one_pair if one_pair?
    :high_card
  end

  def beats?(other_hand)
    if self.class.order[rank] < other_hand.class.order[other_hand.rank]
      true
    elsif self.class.order[rank] == other_hand.class.order[other_hand.rank]
      # should actually get the high card from the relevant cards
      get_high_card_value > other_hand.get_high_card_value
    else
      false
    end
  end

  def get_high_card_value
    Card.poker_value (values.max_by { |value| Card.poker_value(value) })
  end

  private

    def suits
      cards.map { |card| card.suit }
    end

    def values
      cards.map { |card| card.value }
    end

    def straight_flush?
      straight? && flush?
    end

    def four_of_a_kind?
      values.any? { |value| values.count(value) == 4 }
    end

    def full_house?
      value_counts = values.map { |value| values.count(value) }
      value_counts.include?(3) && value_counts.include?(2)
    end

    def flush?
      suits.all? { |suit| suit == suits[0] }
    end

    def straight?
      poker_vals = values.map { |value| Card.poker_value(value) }
      poker_vals == (poker_vals[-1] .. poker_vals[0]).to_a.reverse
    end

    def three_of_a_kind?
      values.any? { |value| values.count(value) == 3 }
    end

    def two_pair?
      value_counts = values.map { |value| values.count(value) }
      value_counts.count(2) == 4
    end

    def one_pair?
      values.any? { |value| values.count(value) == 2 }
    end

end
