class Recipe
  attr_reader :label, :image, :source, :url, :ingredients, :yield, :diet

  def initialize( label, options = {} )
    raise ArgumentError if label == nil || label == ""

    @label = label
    @image = options[:image]
    @source = options[:source]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @yield = options[:yield]
    @diet = options[:diet]
  end
end
