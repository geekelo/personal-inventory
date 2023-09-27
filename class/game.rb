require_relative 'item'

class Game < Item
  attr_accessor :publish_date, :multiplayer, :last_played_at

  def initialize(title, publish_date, multiplayer, last_played_at)
    super(title, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end
