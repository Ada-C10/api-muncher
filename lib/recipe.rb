class Recipe
  attr_reader :label, :uri, :ingredients, :dietaries

  def initialize(label, uri, ingredients, dietaries)
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == "" || ingredients == nil || ingredients =="" || dietaries == nil || dietaries ==""

    @label = label
    @uri = uri.partition("_").last
    @ingredients = ingredients
    @dietaries = dietaries

  end
  #
  # def parsed_uri
  #   return self.uri.partition("_").last
  # end

end
