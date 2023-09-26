require 'date'

class item
  attr_accessor :publish_date, :archived
  attr_reader :genre, :author, :label
  
  def initialize(publish_date, archived: false)
    @id = rand(1_000_000)
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
  end

  def author=(author)
    @author=author
  end

  def label=(label)
    @label=label
  end

  
  def can_be_archived?
    current_date = Date.today
    year = current_date.year - @publish_date.year
    year > 10
  end

end