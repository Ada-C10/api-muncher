class Recipe
  attr_reader :uri, :label, :image, :yield, :dietLabels, :healthLabels, :ingredients, :calories

  def initialize(uri: "", label: "", image: "" , yield: 0, dietLabels: [], healthLabels: [], ingredients: [] )
    raise ArgumentError if uri == nil || label == ""

    @uri = uri
    @label = label
    @image = image
    @yield = yield
    @dietLabels = dietLabels
    @healthLabels = healthLabels
    @ingredients = ingredients
  end
end
