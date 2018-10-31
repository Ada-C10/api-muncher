class Recipe
  attr_reader :label, :image, :ingredients, :dietary_info

  def initialize(name, id, options = {} )
    raise ArgumentError if label == nil || label == ""

    @name = name
    @id = id

    @ingredients = options[:ingredients] #["ingredients"]["text"]
    @image = options[:image]
    @dietary_info = options[:dietary_info] #health labels
  end
end
