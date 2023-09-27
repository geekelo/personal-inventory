class Movie < Item
  attr_accessor :silent, :title
  def initialize(title, publish_date, silent: false)
    super(title, publish_date)
    @silent = silent
  end

  def can_be_archived?
    return true if super || @silent
  end
end
