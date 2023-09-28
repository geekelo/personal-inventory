require_relative 'item'

class Book < Item
  attr_accessor :author, :publisher, :cover_state, :publish_date
  attr_reader :id, :label

  def initialize(_author, publisher, cover_state, publish_date)
    super(publish_date)
    @id = rand(100_000)
    @cover_state = cover_state
    @publisher = publisher
  end

  def can_be_archived?
    if @cover_state == 'bad' || super
      true
    else
      false
    end
  end
end
