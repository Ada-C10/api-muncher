class Recipe
  attr_reader :label, :image, :id, :health_info, :ingredients, :url

  def initialize(label, image, uri, health_info: nil, ingredients: nil, url: nil)
    raise ArgumentError if label == nil || label == "" || image == nil || image == "" || uri == nil || uri == ""

    @label = label
    @image = image
    @id = uri.split("_").last
    @health_info = health_info
    @ingredients = ingredients
    @url = url
  end
end
