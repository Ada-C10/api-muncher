class Recipe
  attr_reader :uri, :label, :image

  def initialize(uri, label, image)
    raise ArgumentError if uri == nil || label == nil || image == nil

    @uri = uri
    @label = label
    @image = image
  end

  def recipe_id
    uri_split = self.uri.split("#")
    return uri_split[1]
  end
end
