class Genre
  attr_accessor :name
  attr_reader :id

  def initialize(name)
    @id = rand(1_000_000)
    @name = name
    @items = []
  end
end