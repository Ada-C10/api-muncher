class Recipe
  attr_reader :name, :photo, :ingredients, :dietary_information

  def initialize(name, photo, uri, options = {} )
    raise ArgumentError if name == nil || name == "" ||
    photo == nil || photo == "" ||
    ingredients == nil || ingredients == []

    @name = name
    @photo = photo
    @uri = uri

    @ingredients = options[:ingredients]
    @dietary_information = options[:dietary_information]

  end
end
