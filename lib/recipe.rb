class Recipe
  attr-reader :label, :image, :uri, :source, :diet_labels

  def initialize(label, uri, image = nil, source = nil, diet_labels = [])
    raise ArgumentError if name == nil || name == "" || uri == nil || uir == ""

    @label = label
    @uri = uri

    @image = image
    @source = source
    @diet_labels = diet_labels

  end

end
