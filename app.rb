require_relative 'class/item'

class catalogApp
  test = Item.new('10-9-2023')
  puts test.move_to_archive
end
