class Recipe
  attr_reader :name, :id, :url, :image, :ingredients, :calories, :health_labels

  def initialize(name: nil, id: nil, url: "", image: "", ingredients: [], calories: "", health_labels:[])
      # raise ArgumentError if name == nil || name == "" || id == nil || id == ""

      @name = name
      @id = id
      @url = url
      @image = image
      @ingredients = ingredients
      @calories = calories
      @health_labels = health_labels
  end


end
