class Recipe
  attr_reader :uri, :label, :image, :source

  def initialize(uri, label, image, source)
    raise ArgumentError if uri == nil || label == nil || image == nil || source == nil

    @uri = uri
    @label = label
    @image = image
    @source = source
  end

  def recipe_id
    uri_split = self.uri.split("#")
    return uri_split[1]
  end
end
