require 'date'
# Require the Genre class from genre.rb
require_relative 'genre'

class Item
  attr_accessor :publish_date, :archived, :genre, :author, :label

  def initialize(publish_date, archived: false)
    @id = rand(1_000_000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def can_be_archived?
    current_date = Date.today
    year = current_date.year - @publish_date.year
    year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
    @archived
  end
end
