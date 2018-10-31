class Recipe
  attr_reader :uri, :label, :image

  def initialize(uri, label, image)
    # raise ArgumentError if uri == nil || label == "" || image = ""

    @uri = uri
    @label = label
    @image = image
    @recipe_id = @uri[41]
  end

  def recipe_id
    uri_length = self.uri.length
    return self.uri[41..uri_length]
  end
end
