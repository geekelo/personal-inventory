require'securerandom'

class Genre
  attr_accessor :name
  attr_reader :id

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end
end