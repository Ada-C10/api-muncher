class Recipe
  attr_reader :uri, :label, :image, :yield, :dietLabels, :healthLabels, :ingredients, :calories

  def initialize(uri, label, image: "" , serving: 0, dietLabels: [], healthLabels: [], ingredients: [], calories: 0 )
    raise ArgumentError if uri == nil || uri == "" || label == nil || label == ""

    @uri = uri
    @label = label

    @image = image
    @yield = serving
    @dietLabels = dietLabels
    @healthLabels = healthLabels
    @ingredients = ingredients
    @calories = calories
  end
end
