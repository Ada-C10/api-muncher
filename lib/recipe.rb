class Recipe
  attr_reader :name, :url, :ingredients, :dietary

  def initialize(name, url, ingredients, dietaries)
    raise ArgumentError if name == nil || name == "" || url == nil || url == "" || ingredients == nil || ingredients =="" || dietaries == nil || dietaries ==""

    @name = name
    @url = url
    @ingredients = ingredients
    @dietaries = dietaries

  end
end
