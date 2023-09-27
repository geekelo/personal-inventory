class Book < Item
  attr_accessor :title, :author, :publisher, :cover_state, :publish_date, :label
  attr_reader :id

  def initialize(title, _author, publisher, cover_state, publish_date, label)
    super(title, publish_date)
    @id = rand(100_000)
    @cover_state = cover_state
    @publisher = publisher
    @label = label
  end

  def can_be_archived?
    if @cover_state == 'bad' || super
      true
    else
      false
    end
  end
end
