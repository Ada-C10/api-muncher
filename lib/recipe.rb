class Recipe
  attr_reader :label, :id, :image, :url, :ingredients, :health
  # shows the name of the recipe and the corresponding photo
  # shows next to within each listed recipe a link to that recipe's detail page
  #
  #
  # Name - label
  # photo - image
  # Link to the original recipe (opens in a new tab)
  # Ingredients
  # Dietary information - diet or health
  # id - uri
  # link - url

  def initialize(label, id, options = {} )
    raise ArgumentError if label == nil || label == "" || id == nil || id == ""

    @label = label
    @id = id

    @image = options[:image]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @health = options[:health]


  end
end
