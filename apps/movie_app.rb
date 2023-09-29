require_relative '../class/item'
require_relative '../class/movie'
require_relative '../class/source'

class MovieApp
  attr_accessor :movies

  def initialize
    # Initialize movies
    @movies = movies_load_data
  end

  # Load existing data from MOVIES JSON files (if any)
  def movies_load_data
    movies = []
    if File.exist?('data/movies.json')
      File.open('data/movies.json', 'r') do |file|
        file.each_line do |line|
          movies << Movie.from_json(line)
        end
      end
    end
    movies
  end

  # Save data to MOVIES JSON files
  def movies_save_data(movies)
    File.open('data/movies.json', 'w') do |file|
      movies.each do |item|
        file.puts JSON.dump(item.to_json)
      end
    end
  end

  # List existing movies
  def list_movies
    puts 'List of Movies:'
    @movies.each do |item|
      puts "- Title: #{item.title}, Source: #{item.source}, Published: #{item.publish_date}, Archived: #{item.archived}"
    end
  end

  # Add new movie
  def add_movie
    puts 'Enter movie title:'
    title = gets.chomp
    puts 'Enter publish date (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Is it silent? (y/n)'
    silent = true if gets.chomp.downcase == 'y'

    movie = Movie.new(title, publish_date, silent: silent)
    movie.move_to_archive
    @movies << movie
    # call add movie source method on the added movies
    add_movie_source
    puts 'Movie added and saved!'
    # call add movie source method
    movies_save_data(movies)
  end

  # Add movie source
  def add_movie_source
    puts 'Enter source name:'
    source_name = gets.chomp

    source = Source.new(source_name)
    movies.each do |item|
      item.source = source.name if item.source.nil?
    end

    puts 'Source added!'
  end

  # List movie source
  def list_movie_source
    puts 'List of Sources:'
    sources = movies.map(&:source).uniq.compact
    sources.each do |source|
      puts "- Name: #{source}"
    end
  end
end
