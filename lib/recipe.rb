class Recipe
  attr_reader :label, :uri, :image, :source, :url, :ingredients, :diet_labels, :health_labels

  def initialize(label, uri, options={})
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @uri = uri

    @image = options[:image]
    @source = options[:source]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @calories = options[:calories]
    @dietlabels = options[:diet_labels]
    @healthlabels = options[:health_labels]
  end

end
