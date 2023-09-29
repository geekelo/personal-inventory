class MusicAlbum < Item
  attr_accessor :on_spotify, :title

  def initialize(title, publish_date, on_spotify: false)
    super(publish_date)
    @on_spotify = on_spotify
    @title = title
  end

  def can_be_archived?
    super && @on_spotify
  end

  def genre=(genre)
    @genre = genre || 'unknown'
  end

  def to_json(*_args)
    {
      title: @title,
      publish_date: @publish_date.to_s,
      archived: @archived,
      genre: @genre
    }
  end

  def self.from_json(json)
    puts "Received JSON: #{json}"
    data = JSON.parse(json)
    item = new(data['title'], data['publish_date'])
    item.archived = data['archived']
    item.genre = data['genre']
    item
  end
end
