
class Recipe
  attr_reader :label, :id, :image, :ingredients,  :health_labels, :url, :recipe_source

  # # def initialize(label, uri, image, options = {})
  # #   raise ArgumentError if label == nil || label == "" || uri == nil || uri == "" || image == nil || image == ""
  # #
  # #   @label = label
  # #   @uri = uri.split.('-')
  # #   @image = image
  # #
  # #   @url = options[:url]
  # #   @ingredients = options[:ingredients]
  # #   @health_labels = options[:health_labels]
  # # end
  #
  def initialize(label, uri, image, ingredients = [], health_labels = [], url = nil, recipe_source = nil)
    raise ArgumentError, "need a label (got #{label})" if label == nil || label == ""
    raise ArgumentError, "need an uri (got #{uri})" if uri == nil || uri == ""
    raise ArgumentError, "need an image (got #{image})" if image == nil || image == ""

    # binding.pry
    @label = label
    @id = uri.split("_").last
    @image = image
    @ingredients = ingredients
    @health_labels = health_labels
    @url = url
    @recipe_source = recipe_source




    #
    # @url = options[:url]
    # @ingredients = options[:ingredients]
    # @health_labels = options[:health_labels]
  end

end
