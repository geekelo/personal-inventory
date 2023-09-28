# spec/music_album_spec.rb
require_relative '../class/music_album'
describe MusicAlbum do
  let(:album) { MusicAlbum.new('Sample Album', '2020-01-01', on_spotify: true) }
  describe '#can_be_archived?' do
    it 'returns false if on_spotify is false' do
      expect(album.can_be_archived?).to be false
    end
    it 'returns true if published_date is older than 10 years and on_spotify is true' do
      album = MusicAlbum.new('Sample Album', '2000-01-01', on_spotify: true)
      expect(album.can_be_archived?).to be true
    end
    it 'returns false if published_date is less than 10 years old and on_spotify is false' do
      album = MusicAlbum.new('Sample Album', (Date.today - 5).to_s, on_spotify: false)
      expect(album.can_be_archived?).to be false
    end
  end
  # Add more tests for other methods as needed
end
