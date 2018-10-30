class Recipe
  attr_reader :label, :image, :uri, :url, :ingredientLines, :healthLabels

  def initialize(label, image, uri, options = {})
    raise ArgumentError if label == nil || label == "" || image == nil || image == "" || uri == nil || uri == ""

    @label = label
    @image = image
    @uri = uri

    @url = options[:url]
    @ingredientLines = options[:ingredientLines]
    @healthLabels = options[:healthLabels]







end
