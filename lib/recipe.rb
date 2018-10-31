class Recipe
  attr_reader :id, :label, :image, :uri, :url, :ingredientLines, :healthLabels

  def initialize(label, image, uri, details = {})
    raise ArgumentError if label == nil || label == "" || image == nil || image == "" || uri == nil || uri == ""

    @label = label
    @image = image
    @uri = uri
    @id = uri.split('_').last
    @url = details[:url]
    @ingredientLines = details[:ingredientLines]
    @healthLabels = details[:healthLabels]
  end







end
