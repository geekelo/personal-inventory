require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date
  attr_reader :id

  def initialize(publish_date, publisher, cover_state, archived: false)
    super(publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    if @cover_state == 'bad' || super
      true
    else
      false
    end
  end
end
