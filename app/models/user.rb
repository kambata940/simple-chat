class User
  attr_reader :name
  @ids = []

  class << self
    attr_accessor :ids
  end

  def initialize(name:)
    @name = name.strip
  end

  def save
    return unless is_valid?

    User.ids << @name
    true
  end

  private

  def is_valid?
    !name.empty? && name.size < 40 && User.ids.exclude?(@name)
  end
end
