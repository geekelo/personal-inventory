def load_books
  if File.exist?('data/books.json')
    load_books_from_file('data/books.json')
  else
    @books = []
  end
end

def load_books_from_file(file_path)
  data = JSON.parse(File.read(file_path))
  @books = data.map { |book_data| create_book_from_data(book_data) }
rescue JSON::ParserError => e
  puts "Error parsing JSON data: #{e.message}"
  @books = []
end

def create_book_from_data(book_data)
  book = Book.new(book_data['publish_date'], book_data['publisher'], book_data['cover_state'])
  assign_label_to_book(book, book_data['label']) if book_data.key?('label')
  book
end

def assign_label_to_book(book, label_data)
  label = find_or_create_label(label_data)
  book.label = label
end

def find_or_create_label(label_data)
  label = @labels.find { |item| item.title == label_data['title'] && item.color == label_data['color'] }
  if label.nil?
    label = Label.new(label_data['title'], label_data['color'])
    @labels << label
  end
  label
end

def load_labels
  File.new('data/labels.json', 'w') unless File.exist?('data/labels.json')
  labels = File.read('data/labels.json')
  return if labels.empty?

  JSON.parse(labels).each do |label|
    @labels.push(Label.new(label['title'], label['color']))
  end
end
