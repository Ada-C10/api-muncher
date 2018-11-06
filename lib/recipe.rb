class Recipe
  attr_reader :label, :uri, :ingredients, :health, :image, :url

  def initialize(label, uri, options = {} )
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @uri = uri.split("recipe_").last

    @ingredients = options[:ingredients]
    # @is_archived = options[:is_archived]
    # @is_general = options[:is_archived]
    @health = options[:health]
    @image = options[:image]
    @url = options[:url]
  end
end
