class MusicAlbum < Item
  attr_accessor :on_spotify, :title

  def initialize(title, publish_date, on: false)
    super(title, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    true if super || @on_spotify
  end

  def to_json(*_args)
    {
      title: @title,
      publish_date: @publish_date.to_s,
      archived: @archived,
      genre: @genre,
      author: @author,
      source: @source,
      label: @label
    }
  end

  def self.from_json(json)
    data = JSON.parse(json)
    item = new(data['title'], data['publish_date'])
    item.archived = data['archived']
    item.genre = data['genre']
    item.author = data['author']
    item.source = data['source']
    item.label = data['label']
    item
  end
end
