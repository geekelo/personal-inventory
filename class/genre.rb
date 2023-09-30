class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = rand(1_000_000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
  end
end
