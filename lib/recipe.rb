class Recipe
  attr_reader :label, :image, :uri, :url, :id, :ingredientLines, :healthLabels

  def initialize(label, image, uri, url, id, options = {} )
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == "" || image == nil || image == ""

    @label = label
    @image = image
    @uri = uri
    @url = url
    @id = uri.split("_")[1]

    @ingredientLines = options[:ingredientLines]
    @healthLabels = options[:healthLabels]
  end
end
