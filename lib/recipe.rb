class Recipe
  attr_reader :name, :image, :uri, :url, :ingredients, :dietLabels

  def initialize(label, image, uri, url, ingredients, dietLabels, options = {})

    raise ArgumentError if label == nil || label.empty?
    raise ArgumentError if image == nil || image.empty?
    raise ArgumentError if uri == nil || uri.empty?
    raise ArgumentError if url == nil || url.empty?
    raise ArgumentError if ingredients == nil || ingredients.empty?
    raise ArgumentError if dietLabels == nil || dietLabels.empty?

    @name = label
    @image = image
    @uri = uri
    @url = url
    @ingredients = ingredients
    @dietLabels = dietLabels

  end


end
