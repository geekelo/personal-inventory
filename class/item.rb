require 'date'
# require_relative 'genre'

class Item
  attr_accessor :title, :publish_date, :archived, :source, :genre, :author, :label

  def initialize(title, publish_date, archived: false)
    @id = rand(1_000_000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @title = title
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
