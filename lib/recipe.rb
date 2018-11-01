class Recipe
  attr_reader :label, :uri, :image, :url, :yield, :dietLabels, :healthLabels, :ingredientLines

  def initialize(recipe_data)
    raise ArgumentError if recipe_data.nil? || recipe_data[:label] == nil || recipe_data[:uri]


    @label = recipe_data[:label]
    @uri = recipe_data[:uri]
    @image = recipe_data[:image]
    @url = recipe_data[:url]
    @yield = recipe_data[:yield]
    @dietLabels = recipe_data[:dietLabels]
    @healthLabels = recipe_data[:healthLabels]
    @ingredientLines = recipe_data[:ingredientLines]

  end



  # from the postman request we get
  # uri, label, image, source, url, shareAs, yield, dietLabels, healthLabels, ingredientLines
end
