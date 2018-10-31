class Recipe
  attr_reader :label, :image, :uri

  def initialize(label, image, uri)
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @image = image
    @uri = uri
  end
end
