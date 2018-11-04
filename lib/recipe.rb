class Recipe
  attr_reader :label, :uri, :source, :image, :ingredients, :diet_labels

  def initialize(label, options = {})
    raise ArgumentError if label == nil || label == ""

    @label = label

    @uri = options[:uri]
    @source = options[:source]
    @image = options[:image]
    @ingredients = options[:ingredients]
    @diet_labels = options[:diet_labels]
  end

end
