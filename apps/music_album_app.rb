require_relative '../class/item'
require_relative '../class/music_album'
require_relative '../class/genre'

class Music_albumApp
  def initialize
  # Initialize music_albums
  @music_albums = music_load_data
  end
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
      @music_albums.each do |item|
        file.puts JSON.dump(item.to_json)
      end
    end
  end

  # List All Music Albums
  def list_music_albums
    puts 'List of Music_albums:'
    @music_albums.each do |item|
      puts "- Title: #{item.title}, Genre: #{item.genre}, Published: #{item.publish_date}, Archived: #{item.archived}"
    end
  end

  # List All Genres
  def list_music_album_genres
    puts 'List of Genre:'
    genres = @music_albums.map(&:genre).uniq.compact
    genres.each do |genre|
      puts "- Name: #{genre}"
    end
  end

  # Add A Music
  def add_music_album
    puts 'Enter music_album title:'
    title = gets.chomp
    puts 'Enter publish date (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Is it on_spotify? (y/n)'
    on_spotify = true if gets.chomp.downcase == 'y'

    music_album = MusicAlbum.new(title, publish_date, on_spotify: on_spotify)
    music_album.move_to_archive
    @music_albums << music_album
    add_music_album_genre
    music_save_data(@music_albums)
    puts 'Music_album added and Saved!'
  end

  # Add music album genre
  def add_music_album_genre
    puts 'Enter genre name:'
    genre_name = gets.chomp

    genre = Genre.new(genre_name)
    @music_albums.each do |item|
      item.genre = genre.name if item.genre.nil?
    end

    puts 'Genre added!'
  end
end 
