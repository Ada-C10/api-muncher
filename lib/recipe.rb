class Recipe
<<<<<<< HEAD
  attr_reader :label, :image, :url, :ingredientLines, :healthLabels

  def initialize(options = {} )
    raise ArgumentError if options[:label] == nil || options[:label] == "" || options[:url] == nil || options[:url] == "" || options[:image] == nil || options[:image] == ""

    @label = options[:label]
    @image = options[:image]
    @url = options[:url]
=======
  attr_reader :label, :image, :url, :ingredientLines, :healthlabels

  def initialize(label, image, url, ingredients, options = {} )
    raise ArgumentError if label == nil || label == "" || url == nil || url == "" || image == nil || image == ""

    @label = label
    @image = image
    @url = url
>>>>>>> 273789d7df17bf7c77e9864cfca23e94f8566734
    @ingredientLines = options[:ingredientLines]
    @healthLabels = options[:healthLabels]
  end
end
