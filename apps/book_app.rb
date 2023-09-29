require_relative '../class/book'
require_relative '../class/label'

class BookApp
  attr_accessor :items, :books, :labels

  def initialize
    @items = []
    @labels = []
    @books = []
  end

  def add_book
    puts 'Add Book Information'
    publisher_name = publisher
    cover_state = cover_state_info
    publish_date = publish_date_info
    selected_label = select_label

    book_data = Book.new(publish_date, publisher_name, cover_state)
    selected_label.add_item(book_data)
    @books << book_data

    puts 'You have successfully added a new book!'
  end

  def publisher
    puts 'Enter Publisher'
    gets.chomp
  end

  def cover_state_info
    puts 'Enter Cover State of the book (true or false)'
    gets.chomp.downcase == 'true'
  end

  def publish_date_info
    puts 'Enter Publish date (YYYY-MM-DD)'
    gets.chomp
  end

  def select_label
    puts 'Existing Labels:'
    @labels.each_with_index do |label, index|
      puts "#{index + 1}. Title: #{label.title}, Color: #{label.color}"
    end

    puts 'Select a label by entering the label number (or enter 0 to create a new label):'
    selection = gets.chomp.to_i

    if selection.zero?
      add_label
    elsif selection.positive? && selection <= @labels.length
      @labels[selection - 1]
    else
      puts 'Invalid label selection.'
      nil
    end
  end

  def add_label
    puts 'Enter the new label title:'
    title = gets.chomp
    puts 'Enter the new label color:'
    color = gets.chomp
    label = @labels.find { |item| item.title == title && item.color == color }
    unless label
      label = Label.new(title, color)
      @labels << label
    end
    label
  end

  def list_books
    @books.each do |book|
      puts "title:#{book.label.title}, Publisher: #{book.publisher},
        Published: #{book.publish_date}, Archived: #{book.archived}"
    end
  end

  def list_labels
    @labels.each do |label|
      puts "#{label.id}. title: #{label.title} (Color: #{label.color})"
    end
  end
end
