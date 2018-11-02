class Recipe
  attr_reader :label, :image, :url, :ingredientLines, :healthLabels

  def initialize(options = {} )
    raise ArgumentError if options[:label] == nil || options[:label] == "" || options[:url] == nil || options[:url] == "" || options[:image] == nil || options[:image] == ""

    @label = options[:label]
    @image = options[:image]
    @url = options[:url]
    @ingredientLines = options[:ingredientLines]
    @healthLabels = options[:healthLabels]
  end
end
