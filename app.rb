require_relative 'class/item'

class App
  test = Item.new('10-9-2023')
  puts test.move_to_archive
end
