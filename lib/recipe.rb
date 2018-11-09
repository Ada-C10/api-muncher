class Recipe
  attr_reader :label, :image, :id, :original_url, :ingredients, :diet_labels, :health_labels, :source

  def initialize(label, image, uri, original_url: "", ingredients: [], diet_labels: [], health_labels: [], source: "")
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @image = image

    recipe_id = /[^_]*$/.match(uri)
    @id = recipe_id[0]

    @original_url = original_url
    @ingredients = ingredients
    @diet_labels = diet_labels
    @health_labels = health_labels
    @source = source
  end
end
