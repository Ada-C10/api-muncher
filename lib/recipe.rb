class Recipe

  attr_reader :label, :image, :uri, :ingredients, :dietary_information, :url

  def initialize(label, image, uri, details = {} )
    # binding.pry
    raise ArgumentError if label == nil || label == "" || image == nil || image == "" || uri == nil || uri == "" || url == nil || url == ""
    @label = label
    @image = image
    @uri = uri
    @ingredients = details[:ingredients]
    @dietary_information = details[:dietary_information]
    @url = details[:url]
  end
end
