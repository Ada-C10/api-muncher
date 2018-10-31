class Recipe
  attr_reader :label, :uri, :ingredients, :healthLabels, :image, :url

  def initialize(name, id, options = {} )
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @uri = uri

    @ingredients = options[:ingredients]
    # @is_archived = options[:is_archived]
    # @is_general = options[:is_archived]
    @health = options[:healthLabels]
    @image = options[:image]
    @url = options[:url]
  end
end
