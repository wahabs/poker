require 'rspec'
require 'card'

class Deck

  def self.build_deck
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  attr_accessor :cards

  def initialize
    @cards = self.class.build_deck
  end

  def draw(n)
    drawn = cards[0...n]
    self.cards = cards[n..-1]
    drawn
  end

  def retake(cards)
    self.cards += cards
  end

  def shuffle
    @cards = cards.shuffle
  end

end
