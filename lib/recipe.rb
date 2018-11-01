class Recipe
  attr_reader :label, :image, :url, :uri, :dietLabels, :healthLabels, :ingredientLines

  def initialize(input)
    @label = input[:label]
    @image = input[:image]
    @url = input[:url]
    @uri = input[:uri]
    @dietLabels = input[:dietLabels]
    @healthLabels = input[:healthLabels]
    @ingredientLines = input[:ingredientLines]

  end

end
