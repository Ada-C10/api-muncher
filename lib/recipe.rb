class Recipe

  attr_reader :label, :image, :uri, :ingredients, :dietary_information, :url

  def initialize(label, uri, details = {} )
    # binding.pry
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""
    @label = label
    @image = details[:image]
    @uri = uri.split("recipe_").last
    @ingredients = details[:ingredients]
    @dietary_information = details[:dietary_information]
    @url = details[:url]
  end
end
