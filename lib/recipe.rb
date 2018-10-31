class Recipe
  #this is a class that can represent a channel
  attr_reader :label, :uri, :healthLabels, :ingredients, :image, :url

  def initialize(label, uri, options = {} )
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @uri = uri

#we're going to package the @purpose etc into the options hash in another method
    @healthLabels = options[:healthLabels]
    @ingredients = options[:ingredients]
    @image = options[:image]
    @url = options[:url]
  end
end
