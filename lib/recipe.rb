class Recipe
  attr_reader :label, :uri, :ingredients, :dietaries, :image, :url

  def initialize(label, uri, ingredients, dietaries, image, url)
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @uri = uri.partition("_").last
    @ingredients = ingredients
    @dietaries = dietaries
    @image = image
    @url = url


  end
  #
  # def parsed_uri
  #   return self.uri.partition("_").last
  # end

end
