class Recipe

  attr_reader :name, :ingredients, :dietary_info, :url, :health_info, :image_url

  def initialize(name, options = {} )
    raise ArgumentError if name == nil || name == ""

    @name = name
    @ingredients = options[:ingredients]
    @url = options[:url]
    @dietary_info = options[:dietary_info]
    @image_url = options[:image_url]
    @health_info = options[:health_info]
  end
end
