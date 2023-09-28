# spec/genre_spec.rb

require_relative '../class/genre'

describe Genre do
  let(:genre) { Genre.new('Sample Genre') }

  describe '#add_item' do
    it 'adds an item to the genre' do
      item = Item.new('Sample Title', '2010-01-01')
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it 'sets the genre of the item' do
      item = Item.new('Sample Title', '2010-01-01')
      genre.add_item(item)
      expect(item.genre).to eq(genre)
    end
  end

  # Add more tests for other methods as needed
end
