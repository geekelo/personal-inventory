
# Load existing data from MUSIC_ALBUMS JSON files (if any)
def music_load_data
    music_albums = []
    if File.exist?('data/music_album.json')
      File.open('data/music_album.json', 'r') do |file|
        file.each_line do |line|
          music_albums << MusicAlbum.from_json(line)
        end
      end
    end
    music_albums
  end
  
  # Save data to MUSIC_ALBUMS JSON files
  def music_save_data(music_albums)
    File.open('data/music_album.json', 'w') do |file|
      music_albums.each do |item|
        file.puts JSON.dump(item.to_json)
      end
    end
  end
  
  # Initialize music_albums
  music_albums = music_load_data