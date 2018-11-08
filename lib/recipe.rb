class Recipe
   # paginates_per 10
  attr_reader :name, :uri, :image, :ingredientLines , :healthLabels

  def initialize(name, uri, image, ingredientLines = '', healthLabels = '' )
    @name = name
    @uri = uri
    @image = image
    @ingredientLines = ingredientLines
    @healthLabels = healthLabels


  end
end
