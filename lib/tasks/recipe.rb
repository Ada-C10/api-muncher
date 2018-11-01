class Recipe

  attr_reader :name, :image

  def initialize(name, options = {})
    raise ArgumentError if name == nil || name == ""

    @name = name
    @image = options[:image]
  end
end
