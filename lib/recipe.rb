class Recipe
  attr_reader :name, :photo, :uri, :ingredients, :dietary_information, :link

  def initialize(name, photo, uri, options = {} )
    raise ArgumentError if name == nil || name == "" ||
    photo == nil || photo == "" ||
    uri == nil || uri == ""

    @name = name
    @photo = photo
    @uri = uri

    @ingredients = options[:ingredients]
    @dietary_information = options[:dietary_information]
    @link = options[:link]

  end
end
