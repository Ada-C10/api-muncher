class Recipe
  attr_reader :label, :uri, :image, :url, :dietLabels, :healthLabels, :ingredientLines

  def initialize(label, uri, image, url, dietLabels, healthLabels, ingredientLines)



    @label = label
    @uri = uri
    @image = image
    @url = url
    @dietLabels = dietLabels
    @ingredientLines = ingredientLines
    @healthLabels = healthLabels

  end

end
