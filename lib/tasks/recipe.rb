class Recipe
  attr_reader: :label, :uri, :image, :url, :ingredients, :healthLabels

  def initialize(label, uri, options = {} )
    raise ArgumentError if label == nil || label == "" || uid == nil || uid == ""

    @label = label
    @uri = uri

    @image = options[:image]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @healthlabels = options[:healthLabels]
  end

end
