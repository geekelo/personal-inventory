require 'json'

# Load existing data from JSON files (if any)
def load_data
  movies = []
  if File.exist?('data/movies.json')
    File.open('data/movies.json', 'r') do |file|
      file.each_line do |line|
        movies << Item.from_json(line)
      end
    end
  end
  movies
end

# Save data to JSON files
def save_data(movies)
  File.open('data/movies.json', 'w') do |file|
    movies.each do |item|
      file.puts JSON.dump(item.to_json)
    end
  end
end

# Initialize movies
movies = load_data

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
  puts '16 - Add a source'
  puts '17 - Exit'
end

loop do
  display_menu
  option = gets.chomp.to_i
  case option
  when 1
    # your code here
  when 2
    # your code here
  when 3
    # your code here
  when 4
    # your code here
  when 5
    # your code here
  when 6
    # your code here
  when 7
    # your code here
  when 8
    # your code here
  when 9
    # your code here
  when 10
    # your code here
  when 11
    # your code here
  when 12
    # your code here
  when 13
    # your code here
  when 14
    # your code here
  when 15
    # your code here
  when 16
    # your code here
  when 17
    puts 'Thanks for using Catalog of My Things app!'
    break
  else
    puts 'Invalid Option, please choose from 1-10'
  end
end
