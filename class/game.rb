require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :publish_date, :title, :multiplayer, :last_played_at

  def initialize(publish_date, title, multiplayer, last_played_at)
    super(publish_date)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    difference = Time.now.year - Date.parse(@last_played_at).year
    super && difference > 2
  end
end
