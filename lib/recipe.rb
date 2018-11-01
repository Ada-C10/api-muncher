class Recipe
  attr_reader :label, :image, :url, :id, :dietLabels, :healthLabels, :ingredientLines

  def initialize(input)
    @label = input[:label]
    @image = input[:image]
    @url = input[:url]
    @id = input[:id]
    @dietLabels = input[:dietLabels]
    @healthLabels = input[:healthLabels]
    @ingredientLines = input[:ingredientLines]

  end

end
