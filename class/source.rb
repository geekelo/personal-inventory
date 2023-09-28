class Source
  attr_accessor :items, :name

  def initialize(name)
    @id = rand(1_000_000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.source = self
    @items << item
  end
end
