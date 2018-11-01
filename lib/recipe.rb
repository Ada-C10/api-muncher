class Recipe
  attr_reader :label, :image, :url, :ingredientLines, :healthlabels

  def initialize(label, image, url, ingredients, options = {} )
    raise ArgumentError if label == nil || label == "" || url == nil || url == "" || image == nil || image == ""

    @label = label
    @image = image
    @url = url
    @ingredientLines = options[:ingredientLines]
    @healthLabels = options[:healthLabels]
  end
end
