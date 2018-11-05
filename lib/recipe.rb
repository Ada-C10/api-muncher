class Recipe
  attr_reader :label, :uri, :url, :source, :image, :ingredients, :diet_labels

  def initialize(label, options = {})

    @label = label

    @uri = options[:uri]
    @url = options[:url]
    @source = options[:source]
    @image = options[:image]
    @ingredients = options[:ingredients]
    @diet_labels = options[:diet_labels]
  end

end
