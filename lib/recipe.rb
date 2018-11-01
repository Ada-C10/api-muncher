class Recipe
  attr_reader :uri, :name, :creator, :image, :recipe_link, :ingredients, :dietary_labels

  def initialize(uri: "", name: "", creator: "", image: "", recipe_link: "", ingredients: "", dietary_labels: [])

    raise ArgumentError if uri == nil

    @uri = uri
    @name = name
    @creator = creator
    @image = image
    @recipe_link = recipe_link
    @ingredients = ingredients
    @dietary_labels = dietary_labels
  end

end
