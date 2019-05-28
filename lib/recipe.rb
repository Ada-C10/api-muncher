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

# [{"text"=>"1 ounce semisweet or bittersweet chocolate, per person","weight"=>28.349523125},{"text"=>"1 tablespoon water, per person", "weight"=>14.786764781}, {"text"=>"1 large egg, per person", "weight"=>50.0}]
