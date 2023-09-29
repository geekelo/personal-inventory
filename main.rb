require_relative 'apps/game_app'
require_relative 'apps/movie_app'
require_relative 'apps/music_album_app'
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
  puts '13 - Add a label'
  puts '14 - Add a author'
  puts '15 - Exit'
end


movie_app = MovieApp.new
music_album_app = Music_albumApp.new
app = GameApp.new
loop do
  display_menu
  option = gets.chomp.to_i
  case option
  when 1
    # your code here
  when 2
    # List All Music Albums
    music_album_app.list_music_albums
  when 3
    # List All Movies
    movie_app.list_movies
  when 4
    app.list_games
  when 5
    # List All Genre
    music_album_app.list_music_album_genres
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
    music_album_app.add_music_album
  when 11
    # Add A Movie
   movie_app.add_movie
  when 12
    app.add_game
  when 13
    # your code here
  when 14
    app.add_author
  when 15
    # Exit Console App
    puts 'Thanks for using Personal Inventory app!'
    break
  else
    puts 'Invalid Option, please choose from 1-10'
  end
end
