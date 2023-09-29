require_relative 'class/item'
require_relative 'class/music_album'
require_relative 'class/genre'
require_relative 'apps/game_app'
require_relative 'apps/movie_app'
require 'json'


def display_menu
  puts '------------------------------------------------------'
  puts 'Welcome to the Catalog of My Things!'
  puts '------------------------------------------------------'
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List all movies'
  puts '4 - List of games'
  puts "5 - List all genres (e.g 'Comedy', 'Thriller')"
  puts "6 - List all labels (e.g. 'Gift', 'New')"
  puts "7 - List all authors (e.g. 'Stephen King')"
  puts "8 - List all sources (e.g. 'From a friend', 'Online shop')"
  puts '9 - Add a book'
  puts '10 - Add a music album'
  puts '11 - Add a movie'
  puts '12 - Add a game'
  puts '13 - Add a genre'
  puts '14 - Add a label'
  puts '15 - Add a author'
  puts '16 - Exit'
end


movie_app = MovieApp.new
app = GameApp.new
loop do
  display_menu
  option = gets.chomp.to_i
  case option
  when 1
    # your code here
  when 2
    # List All Music Albums
    puts 'List of Music_albums:'
    music_albums.each do |item|
      puts "- Title: #{item.title}, Genre: #{item.genre}, Published: #{item.publish_date}, Archived: #{item.archived}"
    end
  when 3
    # List All Movies
    #movie_app.movies_load_data
    movie_app.list_movies
  when 4
    app.list_games
  when 5
    # List All Genre
    puts 'List of Genre:'
    genres = music_albums.map(&:genre).uniq.compact
    genres.each do |genre|
      puts "- Name: #{genre}"
    end
  when 6
    # your code here
  when 7
    app.list_authors
  when 8
    # List All Sources
    movie_app.list_movie_source
  when 9
    # your code here
  when 10
    # Add A Music
    puts 'Enter music_album title:'
    title = gets.chomp
    puts 'Enter publish date (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Is it on_spotify? (y/n)'
    on_spotify = true if gets.chomp.downcase == 'y'

    music_album = MusicAlbum.new(title, publish_date, on_spotify: on_spotify)
    music_album.move_to_archive
    music_albums << music_album

    puts 'Music_album added!'
  when 11
    # Add A Movie
   movie_app.add_movie
  when 12
    app.add_game
  when 13
    # Add Music_album genre
    puts 'Enter genre name:'
    genre_name = gets.chomp

    genre = Genre.new(genre_name)
    music_albums.each do |item|
      item.genre = genre.name if item.genre.nil?
    end

    puts 'Genre added!'
  when 14
    # your code here
  when 15
    app.add_author
  when 16
    # Save Movies data to JSON files before exiting
    # movie_app.movies_save_data(movies)
    # Save Music_album data to JSON files before exiting
    # music_save_data(music_albums)
    puts 'Thanks for using Catalog of My Things app!'
    break
  else
    puts 'Invalid Option, please choose from 1-10'
  end
end
