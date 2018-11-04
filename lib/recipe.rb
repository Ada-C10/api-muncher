class Recipe

  attr_accessor :label, :image, :source, :url, :id, :dietLabels, :healthLabels, :ingredientLines

  def initialize(input)
    @label = input[:label]
    @image = input[:image]
    @source = input[:source]
    @url = input[:url]
    @id = input[:id]
    @dietLabels = input[:dietLabels]
    @healthLabels = input[:healthLabels]
    @ingredientLines = input[:ingredientLines]

  end

end
