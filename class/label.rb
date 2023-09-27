class label 
attr_accessor :title, :color, :items

def initialize(title, color)
   @id = rand(1_000_000)
   @title = title
   @color = color
   @items =[]
end

def add_item(item)
   @items.push(item)
end
end
