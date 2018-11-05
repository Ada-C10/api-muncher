class Recipe
  attr_reader :uri, :label, :image, :source, :url, :ingredients, :health, :cautions

  def initialize(uri, label, image, source, url, ingredientLines, healthLabels, cautions)
    raise ArgumentError if label == nil || label == "" || uri == "" || uri == nil

    @uri = uri
    @label = label
    @image = image
    @source = source
    @url = url
    @ingredients = ingredientLines
    @health = healthLabels
    @cautions = cautions
    
  end
end
