class Recipe
  attr_reader :label, :url, :image, :ingredientLines

  def initialize(label, url, options = {})
    # the part that makes the label and url required
    # raise ArgumentError if label == nil || url == nil

    @label = label
    @url = url


    @image = options[:image]
    @ingredientLines = options[:ingredientLines]

  end
end
